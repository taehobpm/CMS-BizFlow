--------------------------------------------------------
--  DDL for Incentives Views
--------------------------------------------------------
CREATE OR REPLACE VIEW VW_INCENTIVES_COM AS

SELECT FD.PROCID AS PROC_ID, X.*
FROM TBL_FORM_DTL FD,
     XMLTABLE('/formData/items' PASSING FD.FIELD_DATA COLUMNS
         INCEN_TYPE VARCHAR2(10) PATH './item[id="incentiveType"]/value'
         , REQ_NUM VARCHAR2(15) PATH './item[id="requestNumber"]/value'
         , REQ_TYPE VARCHAR2(20) PATH './item[id="requestType"]/value'
         , REQ_DATE VARCHAR2(10) PATH './item[id="requestDate"]/value'
         , ADMIN_CODE VARCHAR2(10) PATH './item[id="administrativeCode"]/value'
         , ORG_NAME VARCHAR2(100) PATH './item[id="organizationName"]/value'
         -- candidate
         , CANDI_NAME VARCHAR2(150) PATH './item[id="candidateName"]/value'
         , CANDI_FIRST VARCHAR2(50) PATH './item[id="candiFirstName"]/value'
         , CANDI_MIDDLE VARCHAR2(50) PATH './item[id="candiMiddleName"]/value'
         , CANDI_LAST VARCHAR2(50) PATH './item[id="candiLastName"]/value'
         -- selectingOfficial
         , SO_NAME VARCHAR2(100) PATH './item[id="selectingOfficial"]/value/name'
         , SO_EMAIL VARCHAR2(100) PATH './item[id="selectingOfficial"]/value/email'
         , SO_ID VARCHAR2(10) PATH './item[id="selectingOfficial"]/value/id'
         -- executiveOfficers
         , XO1_NAME VARCHAR2(100) PATH './item[id="executiveOfficers"]/value[1]/name'
         , XO1_EMAIL VARCHAR2(100) PATH './item[id="executiveOfficers"]/value[1]/email'
         , XO1_ID VARCHAR2(10) PATH './item[id="executiveOfficers"]/value[1]/id'
         , XO2_NAME VARCHAR2(100) PATH './item[id="executiveOfficers"]/value[2]/name'
         , XO2_EMAIL VARCHAR2(100) PATH './item[id="executiveOfficers"]/value[2]/email'
         , XO2_ID VARCHAR2(10) PATH './item[id="executiveOfficers"]/value[2]/id'
         , XO3_NAME VARCHAR2(100) PATH './item[id="executiveOfficers"]/value[3]/name'
         , XO3_EMAIL VARCHAR2(100) PATH './item[id="executiveOfficers"]/value[3]/email'
         , XO3_ID VARCHAR2(10) PATH './item[id="executiveOfficers"]/value[3]/id'
         -- hrLiaisons
         , HRL1_NAME VARCHAR2(100) PATH './item[id="hrLiaisons"]/value[1]/name'
         , HRL1_EMAIL VARCHAR2(100) PATH './item[id="hrLiaisons"]/value[1]/email'
         , HRL1_ID VARCHAR2(10) PATH './item[id="hrLiaisons"]/value[1]/id'
         , HRL2_NAME VARCHAR2(100) PATH './item[id="hrLiaisons"]/value[2]/name'
         , HRL2_EMAIL VARCHAR2(100) PATH './item[id="hrLiaisons"]/value[2]/email'
         , HRL2_ID VARCHAR2(10) PATH './item[id="hrLiaisons"]/value[2]/id'
         , HRL3_NAME VARCHAR2(100) PATH './item[id="hrLiaisons"]/value[3]/name'
         , HRL3_EMAIL VARCHAR2(100) PATH './item[id="hrLiaisons"]/value[3]/email'
         , HRL3_ID VARCHAR2(10) PATH './item[id="hrLiaisons"]/value[3]/id'
         -- hrSpecialist
         , HRS1_NAME VARCHAR2(100) PATH './item[id="hrSpecialist"]/value/name'
         , HRS1_EMAIL VARCHAR2(100) PATH './item[id="hrSpecialist"]/value/email'
         , HRS1_ID VARCHAR2(10) PATH './item[id="hrSpecialist"]/value/id'
         -- hrSpecialist2
         , HRS2_NAME VARCHAR2(100) PATH './item[id="hrSpecialist2"]/value/name'
         , HRS2_EMAIL VARCHAR2(100) PATH './item[id="hrSpecialist2"]/value/email'
         , HRS2_ID VARCHAR2(10) PATH './item[id="hrSpecialist2"]/value/id'
         -- TABG Division Director
         , DGHO_NAME VARCHAR2(100) PATH './item[id="dghoDirector"]/value/name'
         , DGHO_EMAIL VARCHAR2(100) PATH './item[id="dghoDirector"]/value/email'
         , DGHO_ID VARCHAR2(10) PATH './item[id="dghoDirector"]/value/id'
         -- TABG Director
         , TABG_NAME VARCHAR2(100) PATH './item[id="tabgDirector"]/value/name'
         , TABG_EMAIL VARCHAR2(100) PATH './item[id="tabgDirector"]/value/email'
         , TABG_ID VARCHAR2(10) PATH './item[id="tabgDirector"]/value/id'
         -- position
         , POS_TITLE VARCHAR2(140) PATH './item[id="positionTitle"]/value'
         , PAY_PLAN VARCHAR2(5) PATH './item[id="payPlan"]/value'
         , SERIES VARCHAR2(140) PATH './item[id="series"]/value'
         , GRADE VARCHAR2(5) PATH './item[id="grade"]/value'
         , POS_DESC_NUM VARCHAR2(20) PATH './item[id="posDescNumber"]/value'
         , TYPE_OF_APPT VARCHAR2(20) PATH './item[id="typeOfAppointment"]/value'
         -- dutyStation
         , DS_STATE VARCHAR2(2) PATH './item[id="dutyStation"]/value[1]/state'
         , DS_CITY VARCHAR2(50) PATH './item[id="dutyStation"]/value[1]/city'
         -- cancellation
         , CANCEL_RESAON VARCHAR2(25) PATH './item[id="cancellationReason"]/value'
         , CANCEL_USER_NAME VARCHAR2(100) PATH './item[id="cancellationUser"]/value/name'
         , CANCEL_USER_ID VARCHAR2(10) PATH './item[id="cancellationUser"]/value/id'
         ) X
WHERE FD.FORM_TYPE = 'CMSINCENTIVES'
;

/

CREATE OR REPLACE VIEW VW_INCENTIVES_PCA AS

SELECT FD.PROCID AS PROC_ID, X.*
FROM TBL_FORM_DTL FD,
     XMLTABLE('/formData/items' PASSING FD.FIELD_DATA COLUMNS
         PCA_TYPE VARCHAR2(10) PATH './item[id="pcaType"]/value'
         , CANDI_AGREE VARCHAR2(5) PATH './item[id="candiAgreeRenewal"]/value'
         -- Chief Physician
         , CP_NAME VARCHAR2(100) PATH './item[id="chiefPhysician"]/value/name'
         , CP_EMAIL VARCHAR2(100) PATH './item[id="chiefPhysician"]/value/email'
         , CP_ID VARCHAR2(10) PATH './item[id="chiefPhysician"]/value/id'
         -- OFM Director
         , OFM_NAME VARCHAR2(100) PATH './item[id="ofmDirector"]/value/name'
         , OFM_EMAIL VARCHAR2(100) PATH './item[id="ofmDirector"]/value/email'
         , OFM_ID VARCHAR2(10) PATH './item[id="ofmDirector"]/value/id'
         -- Does the PCA require the Office of the Administrator approval?
         , ADMIN_APPROVAL_REQ VARCHAR2(5) PATH './item[id="requireAdminApproval"]/value'
         -- OHC Director
         , OHC_NAME VARCHAR2(100) PATH './item[id="ohcDirector"]/value/name'
         , OHC_EMAIL VARCHAR2(100) PATH './item[id="ohcDirector"]/value/email'
         , OHC_ID VARCHAR2(10) PATH './item[id="ohcDirector"]/value/id'
         -- Administrator
         , OADMIN_NAME VARCHAR2(100) PATH './item[id="offAdmin"]/value/name'
         , OADMIN_EMAIL VARCHAR2(100) PATH './item[id="offAdmin"]/value/email'
         , OADMIN_ID VARCHAR2(10) PATH './item[id="offAdmin"]/value/id'
         -- Position
         , WORK_SCHEDULE VARCHAR2(15) PATH './item[id="workSchedule"]/value'
         , HOURS_PER_WEEK VARCHAR2(5) PATH './item[id="hoursPerWeek"]/value'
         , BD_CERT_REQ VARCHAR2(5) PATH './item[id="requireBoardCert"]/value'
         , LIC_INFO VARCHAR2(140) PATH './item[id="licenseInfo"]/value'
         -- licenseState
         , LIC_STATE1_STATE VARCHAR2(2) PATH './item[id="licenseState"]/value[1]/state'
         , LIC_STATE1_NAME VARCHAR2(50) PATH './item[id="licenseState"]/value[1]/name'
         , LIC_STATE1_EXP_DATE VARCHAR2(10) PATH './item[id="licenseState"]/value[1]/expDate'
         , LIC_STATE2_STATE VARCHAR2(2) PATH './item[id="licenseState"]/value[2]/state'
         , LIC_STATE2_NAME VARCHAR2(50) PATH './item[id="licenseState"]/value[2]/name'
         , LIC_STATE2_EXP_DATE VARCHAR2(10) PATH './item[id="licenseState"]/value[2]/expDate'
         -- boardCertSpecialty
         , BD_CERT_SPEC1 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[1]/text'
         , BD_CERT_SPEC2 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[2]/text'
         , BD_CERT_SPEC3 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[3]/text'
         , BD_CERT_SPEC4 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[4]/text'
         , BD_CERT_SPEC5 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[5]/text'
         , BD_CERT_SPEC6 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[6]/text'
         , BD_CERT_SPEC7 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[7]/text'
         , BD_CERT_SPEC8 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[8]/text'
         , BD_CERT_SPEC9 VARCHAR2(30) PATH './item[id="boardCertSpecialty"]/value[9]/text'
         , BD_CERT_SPEC_OTHER VARCHAR2(140) PATH './item[id="otherSpeciality"]/value'
         -- allowance
         , LEN_SERVED VARCHAR2(25) PATH './item[id="lengthOfServed"]/value'
         , LEN_SERVICE VARCHAR2(2) PATH './item[id="lengthOfService"]/value'
         , ALW_CATEGORY VARCHAR2(15) PATH './item[id="allowanceCategory"]/value'
         , ALW_BD_CERT VARCHAR2(15) PATH './item[id="allowanceBoardCertification"]/value'
         , ALW_MULTI_YEAR_AGMT VARCHAR2(15) PATH './item[id="allowanceMultiYearAgreement"]/value'
         , ALW_MISSION_SC VARCHAR2(15) PATH './item[id="allowanceMissionSpecificCriteria"]/value'
         , ALW_TOTAL VARCHAR2(15) PATH './item[id="allowanceTotal"]/value'
         , ALW_TOTAL_PAYABLE VARCHAR2(15) PATH './item[id="totalPayablePCACalculation"]/value'
         -- remarks
         , DETAIL_REMARKS VARCHAR2(500) PATH './item[id="detailRemarks"]/value'
         -- Review
         , RVW_SO_NAME VARCHAR2(100) PATH './item[id="reviewSO"]/value'
         , RVW_SO_ID VARCHAR2(10) PATH './item[id="reviewSOId"]/value'
         , RVW_SO_DATE VARCHAR2(10) PATH './item[id="reviewSODate"]/value'
         , RVW_DGHO_NAME VARCHAR2(100) PATH './item[id="reviewDGHO"]/value'
         , RVW_DGHO_ID VARCHAR2(10) PATH './item[id="reviewDGHOId"]/value'
         , RVW_DGHO_DATE VARCHAR2(10) PATH './item[id="reviewDGHODate"]/value'
         , RVW_CP_NAME VARCHAR2(100) PATH './item[id="reviewCP"]/value'
         , RVW_CP_ID VARCHAR2(10) PATH './item[id="reviewCPId"]/value'
         , RVW_CP_DATE VARCHAR2(10) PATH './item[id="reviewCPDate"]/value'
         , RVW_OFM_NAME VARCHAR2(100) PATH './item[id="reviewOFM"]/value'
         , RVW_OFM_ID VARCHAR2(10) PATH './item[id="reviewOFMId"]/value'
         , RVW_OFM_DATE VARCHAR2(10) PATH './item[id="reviewOFMDate"]/value'
         , RVW_TABG_NAME VARCHAR2(100) PATH './item[id="reviewTABG"]/value'
         , RVW_TABG_ID VARCHAR2(10) PATH './item[id="reviewTABGId"]/value'
         , RVW_TABG_DATE VARCHAR2(10) PATH './item[id="reviewTABGDate"]/value'
         , RVW_OHC_NAME VARCHAR2(100) PATH './item[id="reviewOHC"]/value'
         , RVW_OHC_ID VARCHAR2(10) PATH './item[id="reviewOHCId"]/value'
         , RVW_OHC_DATE VARCHAR2(10) PATH './item[id="reviewOHCDate"]/value'
         -- Approvals
         , APPROVAL_TABG_NAME VARCHAR2(100) PATH './item[id="pcaApproveTABG"]/value'
         , APPROVAL_TABG_ID VARCHAR2(10) PATH './item[id="pcaApproveTABGId"]/value'
         , APPROVAL_TABG_DATE VARCHAR2(10) PATH './item[id="pcaApproveTABGDate"]/value'
         , APPROVAL_OADMIN_NAME VARCHAR2(100) PATH './item[id="pcaApproveADM"]/value'
         , APPROVAL_OADMIN_ID VARCHAR2(10) PATH './item[id="pcaApproveADMId"]/value'
         , APPROVAL_OADMIN_DATE VARCHAR2(10) PATH './item[id="pcaApproveADMDate"]/value'
         ) X
WHERE FD.FORM_TYPE = 'CMSINCENTIVES'
;
/


CREATE OR REPLACE VIEW VW_INCENTIVES_SAM AS

SELECT FD.PROCID AS PROC_ID, X.*
FROM TBL_FORM_DTL FD,
     XMLTABLE('/formData/items' PASSING FD.FIELD_DATA COLUMNS
         INIT_SALARY_GRADE VARCHAR2(5) PATH './item[id="hrInitialSalaryGrade"]/value'
         , INIT_SALARY_STEP VARCHAR2(5) PATH './item[id="hrInitialSalaryStep"]/value'
         , INIT_SALARY_SALARY_PER_ANNUM VARCHAR2(20) PATH './item[id="hrInitialSalarySalaryPerAnnum"]/value'
         , INIT_SALARY_LOCALITY_PAY_SCALE VARCHAR2(200) PATH './item[id="hrInitialSalaryLocalityPayScale"]/value'
         , SUPPORT_SAM VARCHAR2(5) PATH './item[id="supportSAM"]/value'
         , RCMD_SALARY_GRADE VARCHAR2(5) PATH './item[id="componentRcmdGrade"]/value'
         , RCMD_SALARY_STEP VARCHAR2(5) PATH './item[id="componentRcmdStep"]/value'
         , RCMD_SALARY_SALARY_PER_ANNUM VARCHAR2(20) PATH './item[id="componentRcmdSalaryPerAnnum"]/value'
         , RCMD_SALARY_LOCALITY_PAY_SCALE VARCHAR2(200) PATH './item[id="componentRcmdLocalityPayScale"]/value'

         , SELECTEE_SALARY_PER_ANNUM VARCHAR2(20) PATH './item[id="selecteeSalaryPerAnnum"]/value'
         , SELECTEE_SALARY_TYPE VARCHAR2(25) PATH './item[id="selecteeSalaryType"]/value'
         , SELECTEE_BONUS VARCHAR2(20) PATH './item[id="selecteeBonus"]/value'
         , SELECTEE_BENEFITS VARCHAR2(500) PATH './item[id="selecteeBenefits"]/value'
         , SELECTEE_TOTAL_COMPENSATION VARCHAR2(20) PATH './item[id="selecteeTotalCompensation"]/value'
         , SUP_DOC_REQ_DATE VARCHAR2(10) PATH './item[id="dateSupDocRequested"]/value'
         , SUP_DOC_RCV_DATE VARCHAR2(10) PATH './item[id="dateSupDocReceived"]/value'
          -- Justification
         , JUSTIFICATION_SUPER_QUAL_DESC VARCHAR2(4000) PATH './item[id="justificationSuperQualificationDesc"]/value'
         , JUSTIFICATION_QUAL_COMP_DESC VARCHAR2(4000) PATH './item[id="justificationQualificationComparedDesc"]/value'
         , JUSTIFICATION_PAY_EQUITY_DESC VARCHAR2(4000) PATH './item[id="justificationPayEquityDesc"]/value'
         , JUSTIFICATION_EXIST_PKG_DESC VARCHAR2(4000) PATH './item[id="justificationExistingCompensationPkgDesc"]/value'
         , JUSTIFICATION_EXPLAIN_CONSID VARCHAR2(4000) PATH './item[id="justificationExplainIncentiveConsideration"]/value'
          -- Review
         , SELECT_MEET_ELIGIBILITY VARCHAR2(100) PATH './item[id="selecteeMeetEligibility"]/value'
         , SELECT_MEET_CRITERIA VARCHAR2(100) PATH './item[id="selecteeMeetCriteria"]/value'
         , SUPERIOR_QUAL_REASON VARCHAR2(100) PATH './item[id="superiorQualificationReason"]/value'
         , OTHER_FACTORS VARCHAR2(140) PATH './item[id="otherFactorsAsExplained"]/value'
         , SPL_AGENCY_NEED_RSN VARCHAR2(140) PATH './item[id="specialAgencyNeedReason"]/value'
         , SPL_AGENCY_NEED_RSN_ESS VARCHAR2(140) PATH './item[id="specialAgencyNeedReasonEssential"]/value'
         , QUAL_REAPPT VARCHAR2(50) PATH './item[id="qualifyingReappointment"]/value'
         , OTHER_EXCEPTS VARCHAR2(140) PATH './item[id="otherExceptions"]/value'
         , BASIC_PAY_RATE_FACTOR1 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[1]/text'
         , BASIC_PAY_RATE_FACTOR2 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[2]/text'
         , BASIC_PAY_RATE_FACTOR3 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[3]/text'
         , BASIC_PAY_RATE_FACTOR4 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[4]/text'
         , BASIC_PAY_RATE_FACTOR5 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[5]/text'
         , BASIC_PAY_RATE_FACTOR6 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[6]/text'
         , BASIC_PAY_RATE_FACTOR7 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[7]/text'
         , BASIC_PAY_RATE_FACTOR8 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[8]/text'
         , BASIC_PAY_RATE_FACTOR9 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[9]/text'
         , BASIC_PAY_RATE_FACTOR10 VARCHAR2(140) PATH './item[id="basicPayRateFactor"]/value[10]/text'
         , OTHER_RLVNT_FACTOR VARCHAR2(140) PATH './item[id="otherRelevantFactors"]/value'
         , OTHER_REQ_JUST_APVD VARCHAR2(5) PATH './item[id="otherReqJustificationApproved"]/value'
         , OTHER_REQ_SUFF_INFO_PRVD VARCHAR2(5) PATH './item[id="otherReqSufficientInformationProvided"]/value'
         , OTHER_REQ_INCEN_REQD VARCHAR2(5) PATH './item[id="otherReqIncentiveRequired"]/value'
         , OTHER_REQ_DOC_PRVD VARCHAR2(5) PATH './item[id="otherReqDocumentationProvided"]/value'
         , HRS_RVW_CERT VARCHAR2(100) PATH './item[id="hrSpecialistReviewCertification"]/value'
         , HRS_NOT_SPT_RSN VARCHAR2(100) PATH './item[id="hrSpecialistNotSupportReason"]/value'
         , RVW_HRS VARCHAR2(100) PATH './item[id="reviewHRSpecialist"]/value'
         , HRS_RVW_DATE VARCHAR2(10) PATH './item[id="hrSpecialistReviewDate"]/value'
         , RCMD_GRADE VARCHAR2(5) PATH './item[id="reviewRcmdGrade"]/value'
         , RCMD_STEP VARCHAR2(5) PATH './item[id="reviewRcmdStep"]/value'
         , RCMD_SALARY_PER_ANNUM VARCHAR2(20) PATH './item[id="reviewRcmdSalaryPerAnnum"]/value'
         , RCMD_LOCALITY_PAY_SCALE VARCHAR2(200) PATH './item[id="reviewRcmdLocalityPayScale"]/value'
         , RCMD_INC_DEC_AMOUNT VARCHAR2(20) PATH './item[id="reviewRcmdIncDecAmount"]/value'
         , RCMD_PERC_DIFF VARCHAR2(10) PATH './item[id="reviewRcmdPercentageDifference"]/value'
         , OHC_APPRO_REQ VARCHAR2(5) PATH './item[id="requireOHCApproval"]/value'
         -- OHC Director
         , RCMD_APPRO_OHC_NAME VARCHAR2(100) PATH './item[id="reviewRcmdApprovalOHCDirector"]/value/name'
         , RCMD_APPRO_OHC_EMAIL VARCHAR2(100) PATH './item[id="reviewRcmdApprovalOHCDirector"]/value/email'
         , RCMD_APPRO_OHC_ID VARCHAR2(10) PATH './item[id="reviewRcmdApprovalOHCDirector"]/value/id'
         , RVW_REMARKS VARCHAR2(500) PATH './item[id="samReviewRemarks"]/value'
          -- Approvals
         , APPROVAL_SO_VALUE VARCHAR2(10) PATH './item[id="approvalSOValue"]/value'
         , APPROVAL_SO VARCHAR2(100) PATH './item[id="approvalSO"]/value'
         , APPROVAL_SO_RESP_DATE VARCHAR2(10) PATH './item[id="approvalSOResponseDate"]/value'
         , APPROVAL_DGHO_VALUE VARCHAR2(10) PATH './item[id="approvalDGHOValue"]/value'
         , APPROVAL_DGHO VARCHAR2(100) PATH './item[id="approvalDGHO"]/value'
         , APPROVAL_DGHO_RESP_DATE VARCHAR2(10) PATH './item[id="approvalDGHOResponseDate"]/value'
         , APPROVAL_TABG_VALUE VARCHAR2(10) PATH './item[id="approvalTABGValue"]/value'
         , APPROVAL_TABG VARCHAR2(100) PATH './item[id="approvalTABG"]/value'
         , APPROVAL_TABG_RESP_DATE VARCHAR2(10) PATH './item[id="approvalTABGResponseDate"]/value'
         , APPROVAL_OHC_VALUE VARCHAR2(10) PATH './item[id="approvalOHCValue"]/value'
         , APPROVAL_OHC VARCHAR2(100) PATH './item[id="approvalOHC"]/value'
         , APPROVAL_OHC_RESP_DATE VARCHAR2(10) PATH './item[id="approvalOHCResponseDate"]/value'
         , APPROVER_NOTES VARCHAR2(500) PATH './item[id="approverNotes"]/value'
         ) X
WHERE FD.FORM_TYPE = 'CMSINCENTIVES'
;
/


CREATE OR REPLACE VIEW VW_INCENTIVES_LE AS

SELECT FD.PROCID AS PROC_ID, X.*
FROM TBL_FORM_DTL FD,
     XMLTABLE('/formData/items' PASSING FD.FIELD_DATA COLUMNS
         -- Details
         INIT_ANN_LA_RATE VARCHAR2(10) PATH './item[id="initialOfferedAnnualLeaveAccrualRate"]/value'
         , SUPPORT_LE VARCHAR2(5) PATH './item[id="supportLE"]/value'
         , PROPS_ANN_LA_RATE VARCHAR2(10) PATH './item[id="proposedAnnualLeaveAccrualRate"]/value'
          -- Justification
         , JUSTIFICATION_SKILL_EXP VARCHAR2(4000) PATH './item[id="justificationSkillAndExperience"]/value'
         , JUSTIFICATION_AGENCY_GOAL VARCHAR2(4000) PATH './item[id="justificationAgencyMissionOrPerformanceGoal"]/value'
          -- Review
         , SELECTEE_ELIGIBILITY VARCHAR2(100) PATH './item[id="leSelecteeEligibility"]/value'
         , HRS_RVW_CERT VARCHAR2(100) PATH './item[id="hrSpecialistLEReviewCertification"]/value'
         , HRS_NOT_SPT_RSN VARCHAR2(100) PATH './item[id="hrSpecialistLENotSupportReason"]/value'
         , RVW_HRS VARCHAR2(100) PATH './item[id="leReviewHRSpecialist"]/value'
         , HRS_RVW_DATE VARCHAR2(10) PATH './item[id="hrSpecialistLEReviewDate"]/value'
         , RCMD_LA_RATE VARCHAR2(10) PATH './item[id="rcmdAnnualLeaveAccrualRate"]/value'
          -- Approvals
         , APPROVAL_SO_VALUE VARCHAR2(10) PATH './item[id="leApprovalSOValue"]/value'
         , APPROVAL_SO VARCHAR2(100) PATH './item[id="leApprovalSO"]/value'
         , APPROVAL_SO_RESP_DATE VARCHAR2(10) PATH './item[id="leApprovalSOResponseDate"]/value'
         , APPROVAL_DGHO_VALUE VARCHAR2(10) PATH './item[id="leApprovalDGHOValue"]/value'
         , APPROVAL_DGHO VARCHAR2(100) PATH './item[id="leApprovalDGHO"]/value'
         , APPROVAL_DGHO_RESP_DATE VARCHAR2(10) PATH './item[id="leApprovalDGHOResponseDate"]/value'
         , APPROVAL_TABG_VALUE VARCHAR2(10) PATH './item[id="leApprovalTABGValue"]/value'
         , APPROVAL_TABG VARCHAR2(100) PATH './item[id="leApprovalTABG"]/value'
         , APPROVAL_TABG_RESP_DATE VARCHAR2(10) PATH './item[id="leApprovalTABGResponseDate"]/value'
         ) X
WHERE FD.FORM_TYPE = 'CMSINCENTIVES'
;
/


CREATE OR REPLACE PROCEDURE SP_UPDATE_INCENTIVES_COM_TABLE
(
    I_PROCID            IN      NUMBER
)
IS
BEGIN
    IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
        DELETE INCENTIVES_COM WHERE PROC_ID = I_PROCID;
        INSERT INTO INCENTIVES_COM (PROC_ID, INCEN_TYPE, REQ_NUM, REQ_TYPE, ADMIN_CODE, ORG_NAME
        , CANDI_NAME, CANDI_FIRST, CANDI_MIDDLE, CANDI_LAST
        , SO_NAME, SO_EMAIL, SO_ID
        , XO1_NAME, XO1_EMAIL, XO1_ID, XO2_NAME, XO2_EMAIL, XO2_ID, XO3_NAME, XO3_EMAIL, XO3_ID
        , HRL1_NAME, HRL1_EMAIL, HRL1_ID, HRL2_NAME, HRL2_EMAIL, HRL2_ID, HRL3_NAME, HRL3_EMAIL, HRL3_ID
        , HRS1_NAME, HRS1_EMAIL, HRS1_ID, HRS2_NAME, HRS2_EMAIL, HRS2_ID
        , DGHO_NAME, DGHO_EMAIL, DGHO_ID
        , TABG_NAME, TABG_EMAIL, TABG_ID, POS_TITLE
        , PAY_PLAN, SERIES, GRADE, POS_DESC_NUM, TYPE_OF_APPT, DS_STATE, DS_CITY, CANCEL_RESAON, CANCEL_USER_NAME, CANCEL_USER_ID)
        SELECT PROC_ID, INCEN_TYPE, REQ_NUM, REQ_TYPE, ADMIN_CODE, ORG_NAME
            , CANDI_NAME, CANDI_FIRST, CANDI_MIDDLE, CANDI_LAST
            , SO_NAME, SO_EMAIL, SO_ID
            , XO1_NAME, XO1_EMAIL, XO1_ID, XO2_NAME, XO2_EMAIL, XO2_ID, XO3_NAME, XO3_EMAIL, XO3_ID
            , HRL1_NAME, HRL1_EMAIL, HRL1_ID, HRL2_NAME, HRL2_EMAIL, HRL2_ID, HRL3_NAME, HRL3_EMAIL, HRL3_ID
            , HRS1_NAME, HRS1_EMAIL, HRS1_ID, HRS2_NAME, HRS2_EMAIL, HRS2_ID
            , DGHO_NAME, DGHO_EMAIL, DGHO_ID
            , TABG_NAME, TABG_EMAIL, TABG_ID, POS_TITLE
            , PAY_PLAN, SERIES, GRADE, POS_DESC_NUM, TYPE_OF_APPT, DS_STATE, DS_CITY, CANCEL_RESAON, CANCEL_USER_NAME, CANCEL_USER_ID
            FROM VW_INCENTIVES_COM WHERE PROC_ID = I_PROCID;
    END IF;

    EXCEPTION
    WHEN OTHERS THEN
        SP_ERROR_LOG();
END;
/


CREATE OR REPLACE PROCEDURE SP_UPDATE_INCENTIVES_PCA_TABLE
(
    I_PROCID            IN      NUMBER
)
IS
BEGIN
    IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
        DELETE INCENTIVES_PCA WHERE PROC_ID = I_PROCID;
        INSERT INTO INCENTIVES_PCA (PROC_ID, PCA_TYPE, CANDI_AGREE
        , CP_NAME, CP_EMAIL, CP_ID , OFM_NAME, OFM_EMAIL, OFM_ID
        , ADMIN_APPROVAL_REQ, OHC_NAME, OHC_EMAIL, OHC_ID, OADMIN_NAME, OADMIN_EMAIL, OADMIN_ID
        , WORK_SCHEDULE, HOURS_PER_WEEK, BD_CERT_REQ, LIC_INFO
        , LIC_STATE1_STATE, LIC_STATE1_NAME, LIC_STATE1_EXP_DATE, LIC_STATE2_STATE, LIC_STATE2_NAME, LIC_STATE2_EXP_DATE
        , BD_CERT_SPEC1, BD_CERT_SPEC2, BD_CERT_SPEC3, BD_CERT_SPEC4, BD_CERT_SPEC5
        , BD_CERT_SPEC6, BD_CERT_SPEC7, BD_CERT_SPEC8, BD_CERT_SPEC9, BD_CERT_SPEC_OTHER
        , LEN_SERVED, LEN_SERVICE, ALW_CATEGORY, ALW_BD_CERT, ALW_MULTI_YEAR_AGMT, ALW_MISSION_SC , ALW_TOTAL, ALW_TOTAL_PAYABLE
        , DETAIL_REMARKS, RVW_SO_NAME, RVW_SO_ID, RVW_SO_DATE, RVW_DGHO_NAME, RVW_DGHO_ID, RVW_DGHO_DATE
        , RVW_CP_NAME, RVW_CP_ID, RVW_CP_DATE, RVW_OFM_NAME, RVW_OFM_ID, RVW_OFM_DATE, RVW_TABG_NAME, RVW_TABG_ID, RVW_TABG_DATE
        , RVW_OHC_NAME, RVW_OHC_ID, RVW_OHC_DATE, APPROVAL_TABG_NAME, APPROVAL_TABG_ID, APPROVAL_TABG_DATE
        , APPROVAL_OADMIN_NAME, APPROVAL_OADMIN_ID, APPROVAL_OADMIN_DATE)
            SELECT PROC_ID, PCA_TYPE, CANDI_AGREE
            , CP_NAME, CP_EMAIL, CP_ID , OFM_NAME, OFM_EMAIL, OFM_ID
            , ADMIN_APPROVAL_REQ, OHC_NAME, OHC_EMAIL, OHC_ID, OADMIN_NAME, OADMIN_EMAIL, OADMIN_ID
            , WORK_SCHEDULE, HOURS_PER_WEEK, BD_CERT_REQ, LIC_INFO
            , LIC_STATE1_STATE, LIC_STATE1_NAME, LIC_STATE1_EXP_DATE, LIC_STATE2_STATE, LIC_STATE2_NAME, LIC_STATE2_EXP_DATE
            , BD_CERT_SPEC1, BD_CERT_SPEC2, BD_CERT_SPEC3, BD_CERT_SPEC4, BD_CERT_SPEC5
            , BD_CERT_SPEC6, BD_CERT_SPEC7, BD_CERT_SPEC8, BD_CERT_SPEC9, BD_CERT_SPEC_OTHER
            , LEN_SERVED, LEN_SERVICE, ALW_CATEGORY, ALW_BD_CERT, ALW_MULTI_YEAR_AGMT, ALW_MISSION_SC , ALW_TOTAL, ALW_TOTAL_PAYABLE
            , DETAIL_REMARKS, RVW_SO_NAME, RVW_SO_ID, RVW_SO_DATE, RVW_DGHO_NAME, RVW_DGHO_ID, RVW_DGHO_DATE
            , RVW_CP_NAME, RVW_CP_ID, RVW_CP_DATE, RVW_OFM_NAME, RVW_OFM_ID, RVW_OFM_DATE, RVW_TABG_NAME, RVW_TABG_ID, RVW_TABG_DATE
            , RVW_OHC_NAME, RVW_OHC_ID, RVW_OHC_DATE, APPROVAL_TABG_NAME, APPROVAL_TABG_ID, APPROVAL_TABG_DATE
            , APPROVAL_OADMIN_NAME, APPROVAL_OADMIN_ID, APPROVAL_OADMIN_DATE
            FROM VW_INCENTIVES_PCA WHERE PROC_ID = I_PROCID;
    END IF;

    EXCEPTION
    WHEN OTHERS THEN
        SP_ERROR_LOG();
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_INCENTIVES_SAM_TABLE
(
    I_PROCID            IN      NUMBER
)
IS
BEGIN
    IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
        DELETE INCENTIVES_SAM WHERE PROC_ID = I_PROCID;
        INSERT INTO INCENTIVES_SAM (PROC_ID, INIT_SALARY_GRADE, INIT_SALARY_STEP, INIT_SALARY_SALARY_PER_ANNUM , INIT_SALARY_LOCALITY_PAY_SCALE
        , SUPPORT_SAM, RCMD_SALARY_GRADE, RCMD_SALARY_STEP, RCMD_SALARY_SALARY_PER_ANNUM, RCMD_SALARY_LOCALITY_PAY_SCALE
        , SELECTEE_SALARY_PER_ANNUM, SELECTEE_SALARY_TYPE, SELECTEE_BONUS, SELECTEE_BENEFITS, SELECTEE_TOTAL_COMPENSATION
        , SUP_DOC_REQ_DATE, SUP_DOC_RCV_DATE, JUSTIFICATION_SUPER_QUAL_DESC, JUSTIFICATION_QUAL_COMP_DESC
        , JUSTIFICATION_PAY_EQUITY_DESC, JUSTIFICATION_EXIST_PKG_DESC, JUSTIFICATION_EXPLAIN_CONSID
        , SELECT_MEET_ELIGIBILITY, SELECT_MEET_CRITERIA, SUPERIOR_QUAL_REASON, OTHER_FACTORS, SPL_AGENCY_NEED_RSN, SPL_AGENCY_NEED_RSN_ESS
        , QUAL_REAPPT, OTHER_EXCEPTS
        , BASIC_PAY_RATE_FACTOR1 , BASIC_PAY_RATE_FACTOR2 , BASIC_PAY_RATE_FACTOR3 , BASIC_PAY_RATE_FACTOR4 , BASIC_PAY_RATE_FACTOR5
        , BASIC_PAY_RATE_FACTOR6 , BASIC_PAY_RATE_FACTOR7 , BASIC_PAY_RATE_FACTOR8 , BASIC_PAY_RATE_FACTOR9 , BASIC_PAY_RATE_FACTOR10
        , OTHER_RLVNT_FACTOR, OTHER_REQ_JUST_APVD, OTHER_REQ_SUFF_INFO_PRVD
        , OTHER_REQ_INCEN_REQD, OTHER_REQ_DOC_PRVD, HRS_RVW_CERT, HRS_NOT_SPT_RSN, RVW_HRS, HRS_RVW_DATE
        , RCMD_GRADE, RCMD_STEP, RCMD_SALARY_PER_ANNUM, RCMD_LOCALITY_PAY_SCALE, RCMD_INC_DEC_AMOUNT, RCMD_PERC_DIFF
        , OHC_APPRO_REQ, RCMD_APPRO_OHC_NAME, RCMD_APPRO_OHC_EMAIL, RCMD_APPRO_OHC_ID
        , RVW_REMARKS, APPROVAL_SO_VALUE, APPROVAL_SO, APPROVAL_SO_RESP_DATE
        , APPROVAL_DGHO_VALUE, APPROVAL_DGHO, APPROVAL_DGHO_RESP_DATE, APPROVAL_TABG_VALUE, APPROVAL_TABG, APPROVAL_TABG_RESP_DATE
        , APPROVAL_OHC_VALUE, APPROVAL_OHC, APPROVAL_OHC_RESP_DATE, APPROVER_NOTES)
            SELECT PROC_ID, INIT_SALARY_GRADE, INIT_SALARY_STEP, INIT_SALARY_SALARY_PER_ANNUM , INIT_SALARY_LOCALITY_PAY_SCALE
            , SUPPORT_SAM, RCMD_SALARY_GRADE, RCMD_SALARY_STEP, RCMD_SALARY_SALARY_PER_ANNUM, RCMD_SALARY_LOCALITY_PAY_SCALE
            , SELECTEE_SALARY_PER_ANNUM, SELECTEE_SALARY_TYPE, SELECTEE_BONUS, SELECTEE_BENEFITS, SELECTEE_TOTAL_COMPENSATION
            , SUP_DOC_REQ_DATE, SUP_DOC_RCV_DATE, JUSTIFICATION_SUPER_QUAL_DESC, JUSTIFICATION_QUAL_COMP_DESC
            , JUSTIFICATION_PAY_EQUITY_DESC, JUSTIFICATION_EXIST_PKG_DESC, JUSTIFICATION_EXPLAIN_CONSID
            , SELECT_MEET_ELIGIBILITY, SELECT_MEET_CRITERIA, SUPERIOR_QUAL_REASON, OTHER_FACTORS, SPL_AGENCY_NEED_RSN, SPL_AGENCY_NEED_RSN_ESS
            , QUAL_REAPPT, OTHER_EXCEPTS
            , BASIC_PAY_RATE_FACTOR1 , BASIC_PAY_RATE_FACTOR2 , BASIC_PAY_RATE_FACTOR3 , BASIC_PAY_RATE_FACTOR4 , BASIC_PAY_RATE_FACTOR5
            , BASIC_PAY_RATE_FACTOR6 , BASIC_PAY_RATE_FACTOR7 , BASIC_PAY_RATE_FACTOR8 , BASIC_PAY_RATE_FACTOR9 , BASIC_PAY_RATE_FACTOR10
            , OTHER_RLVNT_FACTOR, OTHER_REQ_JUST_APVD, OTHER_REQ_SUFF_INFO_PRVD
            , OTHER_REQ_INCEN_REQD, OTHER_REQ_DOC_PRVD, HRS_RVW_CERT, HRS_NOT_SPT_RSN, RVW_HRS, HRS_RVW_DATE
            , RCMD_GRADE, RCMD_STEP, RCMD_SALARY_PER_ANNUM, RCMD_LOCALITY_PAY_SCALE, RCMD_INC_DEC_AMOUNT, RCMD_PERC_DIFF
            , OHC_APPRO_REQ, RCMD_APPRO_OHC_NAME, RCMD_APPRO_OHC_EMAIL, RCMD_APPRO_OHC_ID
            , RVW_REMARKS, APPROVAL_SO_VALUE, APPROVAL_SO, APPROVAL_SO_RESP_DATE
            , APPROVAL_DGHO_VALUE, APPROVAL_DGHO, APPROVAL_DGHO_RESP_DATE, APPROVAL_TABG_VALUE, APPROVAL_TABG, APPROVAL_TABG_RESP_DATE
            , APPROVAL_OHC_VALUE, APPROVAL_OHC, APPROVAL_OHC_RESP_DATE, APPROVER_NOTES
            FROM VW_INCENTIVES_SAM WHERE PROC_ID = I_PROCID;
    END IF;

    EXCEPTION
    WHEN OTHERS THEN
        SP_ERROR_LOG();
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_INCENTIVES_LE_TABLE
(
    I_PROCID            IN      NUMBER
)
IS
BEGIN
    IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
        DELETE INCENTIVES_LE WHERE PROC_ID = I_PROCID;
        INSERT INTO INCENTIVES_LE (PROC_ID, INIT_ANN_LA_RATE, SUPPORT_LE, PROPS_ANN_LA_RATE
        , JUSTIFICATION_SKILL_EXP, JUSTIFICATION_AGENCY_GOAL, SELECTEE_ELIGIBILITY
        , HRS_RVW_CERT, HRS_NOT_SPT_RSN, RVW_HRS, HRS_RVW_DATE, RCMD_LA_RATE
        , APPROVAL_SO_VALUE, APPROVAL_SO, APPROVAL_SO_RESP_DATE, APPROVAL_DGHO_VALUE, APPROVAL_DGHO, APPROVAL_DGHO_RESP_DATE
        , APPROVAL_TABG_VALUE, APPROVAL_TABG, APPROVAL_TABG_RESP_DATE)
            SELECT PROC_ID, INIT_ANN_LA_RATE, SUPPORT_LE, PROPS_ANN_LA_RATE
            , JUSTIFICATION_SKILL_EXP, JUSTIFICATION_AGENCY_GOAL, SELECTEE_ELIGIBILITY
            , HRS_RVW_CERT, HRS_NOT_SPT_RSN, RVW_HRS, HRS_RVW_DATE, RCMD_LA_RATE
            , APPROVAL_SO_VALUE, APPROVAL_SO, APPROVAL_SO_RESP_DATE, APPROVAL_DGHO_VALUE, APPROVAL_DGHO, APPROVAL_DGHO_RESP_DATE
            , APPROVAL_TABG_VALUE, APPROVAL_TABG, APPROVAL_TABG_RESP_DATE
            FROM VW_INCENTIVES_LE WHERE PROC_ID = I_PROCID;
    END IF;

    EXCEPTION
    WHEN OTHERS THEN
        SP_ERROR_LOG();
END;
/

CREATE OR REPLACE PROCEDURE SP_UPDATE_INCENTIVES_TABLE
(
    I_PROCID            IN      NUMBER
    , I_FIELD_DATA      IN      XMLTYPE
)
IS
    V_XMLVALUE             XMLTYPE;
    V_INCENTIVE_TYPE     NVARCHAR2(50);

    BEGIN
        IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
            V_XMLVALUE := I_FIELD_DATA.EXTRACT('/formData/items/item[id="incentiveType"]/value/text()');
            IF V_XMLVALUE IS NOT NULL THEN
                V_INCENTIVE_TYPE := V_XMLVALUE.GETSTRINGVAL();
            ELSE
                V_INCENTIVE_TYPE := NULL;
            END IF;

            SP_UPDATE_INCENTIVES_COM_TABLE(I_PROCID);

            IF 'PCA' = V_INCENTIVE_TYPE THEN
                SP_UPDATE_INCENTIVES_PCA_TABLE(I_PROCID);
            ELSIF 'SAM' = V_INCENTIVE_TYPE THEN
                SP_UPDATE_INCENTIVES_SAM_TABLE(I_PROCID);
            ELSIF 'LE' = V_INCENTIVE_TYPE THEN
                SP_UPDATE_INCENTIVES_LE_TABLE(I_PROCID);
            END IF;
        END IF;

        EXCEPTION
        WHEN OTHERS THEN
            SP_ERROR_LOG();
    END;
/

GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_COM TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_PCA TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_SAM TO HHS_CMS_HR_RW_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_LE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_COM_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_PCA_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_SAM_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_LE_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_TABLE TO HHS_CMS_HR_RW_ROLE;

GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_COM TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_PCA TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_SAM TO HHS_CMS_HR_DEV_ROLE;
GRANT SELECT ON HHS_CMS_HR.VW_INCENTIVES_LE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_COM_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_PCA_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_SAM_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_LE_TABLE TO HHS_CMS_HR_DEV_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_TABLE TO HHS_CMS_HR_DEV_ROLE;

