
--------------------------------------------------------
--  DDL for Table INCENTIVES_LOOKUP
--------------------------------------------------------

CREATE TABLE INCENTIVES_LOOKUP
(
	LOOKUP_TYPE VARCHAR2(100),
	LOOKUP_TYPE_VALUE VARCHAR2(150),
	TIER VARCHAR2(10),
	MIN_RANGE NUMBER(10),
	MAX_RANGE NUMBER(10),
	MONETARY_RANGE_LABEL VARCHAR2(50)
);

GRANT SELECT ON HHS_CMS_HR.INCENTIVES_LOOKUP TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.INCENTIVES_LOOKUP TO HHS_CMS_HR_DEV_ROLE;

INSERT ALL
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Staff Physician or Dentist','1','$0',0,0)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Non-Supervisory Regional Office Chief Physician or Dentist','1','$0',0,0)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Supervisor','2','$0 – $35,000',0,35000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Division Director','2','$0 – $35,000',0,35000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Deputy Division Director','2','$0 – $35,000',0,35000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Group Director','3a','$20,000 – $55,000',0,55000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Deputy Group Director','3a','$20,000 – $55,000',0,55000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Center or Office Director','3b','$40,000 – $70,000',0,70000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','Center or Office Deputy Director','3b','$40,000 – $70,000',0,70000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','CMS Chief Physician or Dentist','3b','$40,000 – $70,000',0,70000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('LevelOfExecutiveResponsability','CMS Deputy Chief Physician or Dentist','3b','$40,000 – $70,000',0,70000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('ExceptionalQualificationFactor','1','N/A','Up to $10,000',0,10000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('ExceptionalQualificationFactor','2','N/A','Up to $10,000',0,10000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('ExceptionalQualificationFactor','3','N/A','Up to $7,000',0,7000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('ExceptionalQualificationFactor','4','N/A','Up to $7,000',0,7000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('ExceptionalQualificationFactor','5','N/A','Up to $6,000',0,6000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','1','1','null',103395,225000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','1','2','null',110000,234000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','1','3','null',120000,262000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','2','1','null',103395,264000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','2','2','null',115000,292000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','2','3','null',130000,320000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','3','1','null',103395,348000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','3','2','null',120000,365000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','3','3','null',135000,385000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','4','1','null',103395,400000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','4','2','null',125000,400000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','5','1','null',150000,309000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','5','2','null',145000,289000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','5','3','null',140000,270000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','6','1','null',145000,265000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','6','2','null',145000,245000)
	INTO HHS_CMS_HR.INCENTIVES_LOOKUP (LOOKUP_TYPE, LOOKUP_TYPE_VALUE, TIER, MONETARY_RANGE_LABEL, MIN_RANGE, MAX_RANGE)
	VALUES ('PayTable','6','3','null',130000,235000)
SELECT * FROM DUAL;
