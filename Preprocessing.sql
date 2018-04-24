
/**************************************************************************

		DATA PRE-PROCESSING / PREPARATION 
	      STAGING FOR TABLEAU OPIATE DATA ANALYSIS

**************************************************************************/

/* 

Data Source: https://www.kaggle.com/apryor6/us-opiate-prescriptions

I used SQL Server 2014 Express and created a local db on my laptop.
Use any db name that you would like.

Upload prescriber-info.csv into <your db name>.dbo.cms-prescriber-info, 
       opioids.csv int <your db name>.dbo.cms-opioids.csv
       overdoses.csv into <your db name>.dbo.cms-overdoses.csv

*/

/* Stage opioids.csv file to one column remove combine brand name and generic name */
TRUNCATE TABLE [cms-opioids]
INSERT INTO [cms-opioids]
    -- Replace - with space. There are no dashes in the drug name within cms-prescriber-info table
	SELECT replace([Drug Name],'-',' ') as [Drug Name]
	FROM [ECE].[dbo].[cms-opioids-stg]
	UNION
   -- Replace / with space. There are no forward slashes in the drug name within cms-prescriber-info table
	SELECT replace([Generic Name],'/',' ') as [Drug Name]
	FROM [ECE].[dbo].[cms-opioids-stg]


/* Stage Cluster groups into one column. Assign a 'Use' for each drug */
TRUNCATE TABLE  [cms-clusters]
INSERT INTO [cms-clusters]
	SELECT replace([pain medicine],'.',' ') as Drug,
	      'pain medicine' as [Use]
	FROM [ECE].[dbo].[cms-clusters-stg]
	UNION
	SELECT replace([sleep/anxiety],'.',' ') as Drug,
	      'sleep/anxiety' as [Use]
	FROM [ECE].[dbo].[cms-clusters-stg]

-- Declare variables for excuting dynamic SQL
DECLARE @ColumnNames  VARCHAR(MAX)
DECLARE @SelectColumnNames VARCHAR(MAX)
DECLARE @SQL VARCHAR(MAX)

/* 
-- Get only the opioid drug name from the columns in cms-prescriber-info. There are 
-- 250 drugs we do not need the non-opioid drugs for our dashboard
-- use system tables to get columns names into rows and assign to @ColumnNames as a string
-- us @ColumnNames in Dynamic SQL below
*/
SET @ColumnNames = (SELECT DISTINCT sq.Columns
			FROM sys.tables t 
			INNER JOIN 
			 (
			SELECT OBJECT_ID, 
			       Columns = STUFF((SELECT ',' + '['+sc.name+']'
						 FROM sys.columns sc
						WHERE sc.object_id = s.object_id
						AND sc.name in (SELECT [Drug Name] as [Opioids/Opiates]
								FROM [ECE].[dbo].[cms-opioids]
								UNION 
								SELECT [Drug] as [Opioids/Opiates]
								FROM [ECE].[dbo].[cms-clusters])
					FOR XML PATH('')),1,1,'')
			 FROM sys.columns s 
					) 
		     sq ON t.object_id = sq.object_id
		     WHERE t.name = 'cms-prescriber-info')

-- Use print to debug
-- PRINT @ColumnNames 
-- The same logic as the one above. Included alias with brackets[]
SET @SelectColumnNames = (SELECT DISTINCT ltrim(rtrim(sq.Columns)) 
			  FROM sys.tables t
			  INNER JOIN 
			   (
			 SELECT OBJECT_ID, 
				 Columns = STUFF((SELECT ',' + 'prs.['+sc.name+']'
						  FROM sys.columns sc
						  WHERE sc.object_id = s.object_id
						  AND sc.name in (SELECT [Drug Name] as [Opioids/Opiates]
								  FROM [ECE].[dbo].[cms-opioids]
								  UNION 
								  SELECT [Drug] as [Opioids/Opiates]
								  FROM [ECE].[dbo].[cms-clusters])
						 FOR XML PATH('')),1,1,'')
			 FROM sys.columns s 
			                  ) 
			sq ON t.object_id = sq.object_id
			WHERE t.name = 'cms-prescriber-info') 

-- Use print to debug
-- PRINT @SelectColumnNames
-- PRINT ''

-- Build SQL String
SET @SQL = 
			'TRUNCATE TABLE [cms-data-load-stg]
			INSERT INTO [cms-data-load-stg]
			SELECT [NPI] ,[Gender] , case when [Gender] = ''F'' then ''Female''
						when [Gender] = ''M'' then ''Male''
						else ''Not Found'' end as [Gender Description],[Credentials] ,[Specialty] ,Abbrev,[State] ,[Population] ,[Deaths], [Opioid Prescriber], [Drug_Name], [Value]
			FROM
			(SELECT prs.[NPI] ,prs.[Gender] ,prs.[Credentials] ,prs.[Specialty] ,prs.[State] as Abbrev
				  ,isnull(st.[State], ''Not Found'') as [State] ,isnull(st.[Population],0) as [Population] ,isnull(st.[Deaths],0) as [Deaths], prs.[Opioid Prescriber]
				  ,'+@SelectColumnNames+'
			  FROM 
				   [ECE].[dbo].[cms-prescriber-info] prs 
				   LEFT JOIN [ECE].[dbo].[cms-overdoses] st ON st.[Abbrev] = prs.[State] ) as scr
			UNPIVOT
			(
			  Value FOR
			  [Drug_Name] in ('+@ColumnNames+')
			) unp
			WHERE Value <> 0'

--PRINT(@SQL)
-- Execute SQL String
EXEC(@SQL)

-- Load into to final table to be used in Custom SQL in Tableau
TRUNCATE TABLE [dbo].[cms-data-load]
INSERT INTO [dbo].[cms-data-load]
SELECT ld.[NPI]
      ,ld.[Gender]
      ,ld.[Gender Description]
      ,ld.[Credentials]
      ,ld.[Specialty]
      ,ld.[Abbrev]
      ,ld.[State]
      ,ld.[Population]
      ,ld.[Deaths]
      ,ld.[Opioid Prescriber]
      ,ld.[Drug_Name]
	  -- Get Use for each drug name in the cms-clusters table
	  ,[Common Use] = (SELECT [Use] FROM ECE.[dbo].[cms-clusters] WHERE drug = ld.[Drug_Name])
      ,ld.[Value]
  FROM [ECE].[dbo].[cms-data-load-stg] ld
