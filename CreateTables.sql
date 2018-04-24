USE [Your Database]
GO
/****** Object:  Table [dbo].[cms-clusters]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-clusters](
	[Drug] [nvarchar](255) NULL,
	[Use] [varchar](13) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms-clusters-stg]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms-clusters-stg](
	[pain medicine] [nvarchar](255) NULL,
	[sleep/anxiety] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms-data-load]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-data-load](
	[NPI] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Gender Description] [varchar](50) NULL,
	[Credentials] [varchar](50) NULL,
	[Specialty] [varchar](150) NULL,
	[Abbrev] [varchar](50) NULL,
	[State] [varchar](50) NOT NULL,
	[Population] [float] NOT NULL,
	[Deaths] [float] NOT NULL,
	[Opioid Prescriber] [float] NULL,
	[Drug_Name] [nvarchar](128) NULL,
	[Common Use] [varchar](13) NULL,
	[Value] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms-data-load-stg]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-data-load-stg](
	[NPI] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Gender Description] [varchar](50) NULL,
	[Credentials] [varchar](50) NULL,
	[Specialty] [varchar](150) NULL,
	[Abbrev] [varchar](50) NULL,
	[State] [varchar](50) NOT NULL,
	[Population] [float] NOT NULL,
	[Deaths] [float] NOT NULL,
	[Opioid Prescriber] [float] NULL,
	[Drug_Name] [nvarchar](128) NULL,
	[Value] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms-opioids]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-opioids](
	[Drug Name] [varchar](8000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms-opioids-stg]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-opioids-stg](
	[Drug Name] [varchar](50) NULL,
	[Generic Name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms-overdoses]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-overdoses](
	[State] [varchar](50) NULL,
	[Population] [float] NULL,
	[Deaths] [float] NULL,
	[Abbrev] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cms-prescriber-info]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cms-prescriber-info](
	[NPI] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Credentials] [varchar](50) NULL,
	[Specialty] [varchar](150) NULL,
	[ABILIFY] [float] NULL,
	[ACETAMINOPHEN CODEINE] [float] NULL,
	[ACYCLOVIR] [float] NULL,
	[ADVAIR DISKUS] [float] NULL,
	[AGGRENOX] [float] NULL,
	[ALENDRONATE SODIUM] [float] NULL,
	[ALLOPURINOL] [float] NULL,
	[ALPRAZOLAM] [float] NULL,
	[AMIODARONE HCL] [float] NULL,
	[AMITRIPTYLINE HCL] [float] NULL,
	[AMLODIPINE BESYLATE] [float] NULL,
	[AMLODIPINE BESYLATE BENAZEPRIL] [float] NULL,
	[AMOXICILLIN] [float] NULL,
	[AMOX TR POTASSIUM CLAVULANATE] [float] NULL,
	[AMPHETAMINE SALT COMBO] [float] NULL,
	[ATENOLOL] [float] NULL,
	[ATORVASTATIN CALCIUM] [float] NULL,
	[AVODART] [float] NULL,
	[AZITHROMYCIN] [float] NULL,
	[BACLOFEN] [float] NULL,
	[BD ULTRA FINE PEN NEEDLE] [float] NULL,
	[BENAZEPRIL HCL] [float] NULL,
	[BENICAR] [float] NULL,
	[BENICAR HCT] [float] NULL,
	[BENZTROPINE MESYLATE] [float] NULL,
	[BISOPROLOL HYDROCHLOROTHIAZIDE] [float] NULL,
	[BRIMONIDINE TARTRATE] [float] NULL,
	[BUMETANIDE] [float] NULL,
	[BUPROPION HCL SR] [float] NULL,
	[BUPROPION XL] [float] NULL,
	[BUSPIRONE HCL] [float] NULL,
	[BYSTOLIC] [float] NULL,
	[CARBAMAZEPINE] [float] NULL,
	[CARBIDOPA LEVODOPA] [float] NULL,
	[CARISOPRODOL] [float] NULL,
	[CARTIA XT] [float] NULL,
	[CARVEDILOL] [float] NULL,
	[CEFUROXIME] [float] NULL,
	[CELEBREX] [float] NULL,
	[CEPHALEXIN] [float] NULL,
	[CHLORHEXIDINE GLUCONATE] [float] NULL,
	[CHLORTHALIDONE] [float] NULL,
	[CILOSTAZOL] [float] NULL,
	[CIPROFLOXACIN HCL] [float] NULL,
	[CITALOPRAM HBR] [float] NULL,
	[CLINDAMYCIN HCL] [float] NULL,
	[CLOBETASOL PROPIONATE] [float] NULL,
	[CLONAZEPAM] [float] NULL,
	[CLONIDINE HCL] [float] NULL,
	[CLOPIDOGREL] [float] NULL,
	[CLOTRIMAZOLE BETAMETHASONE] [float] NULL,
	[COLCRYS] [float] NULL,
	[COMBIVENT RESPIMAT] [float] NULL,
	[CRESTOR] [float] NULL,
	[CYCLOBENZAPRINE HCL] [float] NULL,
	[DEXILANT] [float] NULL,
	[DIAZEPAM] [float] NULL,
	[DICLOFENAC SODIUM] [float] NULL,
	[DICYCLOMINE HCL] [float] NULL,
	[DIGOX] [float] NULL,
	[DIGOXIN] [float] NULL,
	[DILTIAZEM 24HR CD] [float] NULL,
	[DILTIAZEM 24HR ER] [float] NULL,
	[DILTIAZEM ER] [float] NULL,
	[DILTIAZEM HCL] [float] NULL,
	[DIOVAN] [float] NULL,
	[DIPHENOXYLATE ATROPINE] [float] NULL,
	[DIVALPROEX SODIUM] [float] NULL,
	[DIVALPROEX SODIUM ER] [float] NULL,
	[DONEPEZIL HCL] [float] NULL,
	[DORZOLAMIDE TIMOLOL] [float] NULL,
	[DOXAZOSIN MESYLATE] [float] NULL,
	[DOXEPIN HCL] [float] NULL,
	[DOXYCYCLINE HYCLATE] [float] NULL,
	[DULOXETINE HCL] [float] NULL,
	[ENALAPRIL MALEATE] [float] NULL,
	[ESCITALOPRAM OXALATE] [float] NULL,
	[ESTRADIOL] [float] NULL,
	[EXELON] [float] NULL,
	[FAMOTIDINE] [float] NULL,
	[FELODIPINE ER] [float] NULL,
	[FENOFIBRATE] [float] NULL,
	[FENTANYL] [float] NULL,
	[FINASTERIDE] [float] NULL,
	[FLOVENT HFA] [float] NULL,
	[FLUCONAZOLE] [float] NULL,
	[FLUOXETINE HCL] [float] NULL,
	[FLUTICASONE PROPIONATE] [float] NULL,
	[FUROSEMIDE] [float] NULL,
	[GABAPENTIN] [float] NULL,
	[GEMFIBROZIL] [float] NULL,
	[GLIMEPIRIDE] [float] NULL,
	[GLIPIZIDE] [float] NULL,
	[GLIPIZIDE ER] [float] NULL,
	[GLIPIZIDE XL] [float] NULL,
	[GLYBURIDE] [float] NULL,
	[HALOPERIDOL] [float] NULL,
	[HUMALOG] [float] NULL,
	[HYDRALAZINE HCL] [float] NULL,
	[HYDROCHLOROTHIAZIDE] [float] NULL,
	[HYDROCODONE ACETAMINOPHEN] [float] NULL,
	[HYDROCORTISONE] [float] NULL,
	[HYDROMORPHONE HCL] [float] NULL,
	[HYDROXYZINE HCL] [float] NULL,
	[IBANDRONATE SODIUM] [float] NULL,
	[IBUPROFEN] [float] NULL,
	[INSULIN SYRINGE] [float] NULL,
	[IPRATROPIUM BROMIDE] [float] NULL,
	[IRBESARTAN] [float] NULL,
	[ISOSORBIDE MONONITRATE ER] [float] NULL,
	[JANTOVEN] [float] NULL,
	[JANUMET] [float] NULL,
	[JANUVIA] [float] NULL,
	[KETOCONAZOLE] [float] NULL,
	[KLOR CON 10] [float] NULL,
	[KLOR CON M10] [float] NULL,
	[KLOR CON M20] [float] NULL,
	[LABETALOL HCL] [float] NULL,
	[LACTULOSE] [float] NULL,
	[LAMOTRIGINE] [float] NULL,
	[LANSOPRAZOLE] [float] NULL,
	[LANTUS] [float] NULL,
	[LANTUS SOLOSTAR] [float] NULL,
	[LATANOPROST] [float] NULL,
	[LEVEMIR] [float] NULL,
	[LEVEMIR FLEXPEN] [float] NULL,
	[LEVETIRACETAM] [float] NULL,
	[LEVOFLOXACIN] [float] NULL,
	[LEVOTHYROXINE SODIUM] [float] NULL,
	[LIDOCAINE] [float] NULL,
	[LISINOPRIL] [float] NULL,
	[LISINOPRIL HYDROCHLOROTHIAZIDE] [float] NULL,
	[LITHIUM CARBONATE] [float] NULL,
	[LORAZEPAM] [float] NULL,
	[LOSARTAN HYDROCHLOROTHIAZIDE] [float] NULL,
	[LOSARTAN POTASSIUM] [float] NULL,
	[LOVASTATIN] [float] NULL,
	[LOVAZA] [float] NULL,
	[LUMIGAN] [float] NULL,
	[LYRICA] [float] NULL,
	[MECLIZINE HCL] [float] NULL,
	[MELOXICAM] [float] NULL,
	[METFORMIN HCL] [float] NULL,
	[METFORMIN HCL ER] [float] NULL,
	[METHADONE HCL] [float] NULL,
	[METHOCARBAMOL] [float] NULL,
	[METHOTREXATE] [float] NULL,
	[METHYLPREDNISOLONE] [float] NULL,
	[METOCLOPRAMIDE HCL] [float] NULL,
	[METOLAZONE] [float] NULL,
	[METOPROLOL SUCCINATE] [float] NULL,
	[METOPROLOL TARTRATE] [float] NULL,
	[METRONIDAZOLE] [float] NULL,
	[MIRTAZAPINE] [float] NULL,
	[MONTELUKAST SODIUM] [float] NULL,
	[MORPHINE SULFATE] [float] NULL,
	[MORPHINE SULFATE ER] [float] NULL,
	[MUPIROCIN] [float] NULL,
	[NABUMETONE] [float] NULL,
	[NAMENDA] [float] NULL,
	[NAMENDA XR] [float] NULL,
	[NAPROXEN] [float] NULL,
	[NASONEX] [float] NULL,
	[NEXIUM] [float] NULL,
	[NIACIN ER] [float] NULL,
	[NIFEDICAL XL] [float] NULL,
	[NIFEDIPINE ER] [float] NULL,
	[NITROFURANTOIN MONO MACRO] [float] NULL,
	[NITROSTAT] [float] NULL,
	[NORTRIPTYLINE HCL] [float] NULL,
	[NOVOLOG] [float] NULL,
	[NOVOLOG FLEXPEN] [float] NULL,
	[NYSTATIN] [float] NULL,
	[OLANZAPINE] [float] NULL,
	[OMEPRAZOLE] [float] NULL,
	[ONDANSETRON HCL] [float] NULL,
	[ONDANSETRON ODT] [float] NULL,
	[ONGLYZA] [float] NULL,
	[OXCARBAZEPINE] [float] NULL,
	[OXYBUTYNIN CHLORIDE] [float] NULL,
	[OXYBUTYNIN CHLORIDE ER] [float] NULL,
	[OXYCODONE ACETAMINOPHEN] [float] NULL,
	[OXYCODONE HCL] [float] NULL,
	[OXYCONTIN] [float] NULL,
	[PANTOPRAZOLE SODIUM] [float] NULL,
	[PAROXETINE HCL] [float] NULL,
	[PHENOBARBITAL] [float] NULL,
	[PHENYTOIN SODIUM EXTENDED] [float] NULL,
	[PIOGLITAZONE HCL] [float] NULL,
	[POLYETHYLENE GLYCOL 3350] [float] NULL,
	[POTASSIUM CHLORIDE] [float] NULL,
	[PRADAXA] [float] NULL,
	[PRAMIPEXOLE DIHYDROCHLORIDE] [float] NULL,
	[PRAVASTATIN SODIUM] [float] NULL,
	[PREDNISONE] [float] NULL,
	[PREMARIN] [float] NULL,
	[PRIMIDONE] [float] NULL,
	[PROAIR HFA] [float] NULL,
	[PROMETHAZINE HCL] [float] NULL,
	[PROPRANOLOL HCL] [float] NULL,
	[PROPRANOLOL HCL ER] [float] NULL,
	[QUETIAPINE FUMARATE] [float] NULL,
	[QUINAPRIL HCL] [float] NULL,
	[RALOXIFENE HCL] [float] NULL,
	[RAMIPRIL] [float] NULL,
	[RANEXA] [float] NULL,
	[RANITIDINE HCL] [float] NULL,
	[RESTASIS] [float] NULL,
	[RISPERIDONE] [float] NULL,
	[ROPINIROLE HCL] [float] NULL,
	[SEROQUEL XR] [float] NULL,
	[SERTRALINE HCL] [float] NULL,
	[SIMVASTATIN] [float] NULL,
	[SOTALOL] [float] NULL,
	[SPIRIVA] [float] NULL,
	[SPIRONOLACTONE] [float] NULL,
	[SUCRALFATE] [float] NULL,
	[SULFAMETHOXAZOLE TRIMETHOPRIM] [float] NULL,
	[SUMATRIPTAN SUCCINATE] [float] NULL,
	[SYMBICORT] [float] NULL,
	[SYNTHROID] [float] NULL,
	[TAMSULOSIN HCL] [float] NULL,
	[TEMAZEPAM] [float] NULL,
	[TERAZOSIN HCL] [float] NULL,
	[TIMOLOL MALEATE] [float] NULL,
	[TIZANIDINE HCL] [float] NULL,
	[TOLTERODINE TARTRATE ER] [float] NULL,
	[TOPIRAMATE] [float] NULL,
	[TOPROL XL] [float] NULL,
	[TORSEMIDE] [float] NULL,
	[TRAMADOL HCL] [float] NULL,
	[TRAVATAN Z] [float] NULL,
	[TRAZODONE HCL] [float] NULL,
	[TRIAMCINOLONE ACETONIDE] [float] NULL,
	[TRIAMTERENE HYDROCHLOROTHIAZID] [float] NULL,
	[VALACYCLOVIR] [float] NULL,
	[VALSARTAN] [float] NULL,
	[VALSARTAN HYDROCHLOROTHIAZIDE] [float] NULL,
	[VENLAFAXINE HCL] [float] NULL,
	[VENLAFAXINE HCL ER] [float] NULL,
	[VENTOLIN HFA] [float] NULL,
	[VERAPAMIL ER] [float] NULL,
	[VESICARE] [float] NULL,
	[VOLTAREN] [float] NULL,
	[VYTORIN] [float] NULL,
	[WARFARIN SODIUM] [float] NULL,
	[XARELTO] [float] NULL,
	[ZETIA] [float] NULL,
	[ZIPRASIDONE HCL] [float] NULL,
	[ZOLPIDEM TARTRATE] [float] NULL,
	[Opioid Prescriber] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
