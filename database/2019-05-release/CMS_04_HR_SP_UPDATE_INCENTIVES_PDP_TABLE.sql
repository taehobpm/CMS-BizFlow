SET DEFINE OFF;

CREATE OR REPLACE PROCEDURE SP_UPDATE_INCENTIVES_PDP_TABLE
(
	I_PROCID            IN      NUMBER
)
IS
BEGIN
	IF I_PROCID IS NOT NULL AND I_PROCID > 0 THEN
		DELETE INCENTIVES_PDP WHERE PROC_ID = I_PROCID;
		INSERT INTO INCENTIVES_PDP (PROC_ID,PDP_TYPE,PDP_TYPE_OTHER,EXISTINGREQUEST,WORK_SCHEDULE
			,HOURS_PER_WEEK,BD_CERT_REQ,LIC_INFO,MARKET_PAY_RATE
			,CURRENT_FED_EMPLOYEE,LEVEL_RESPONSIBILITY,EXEC_RESP_AMT_REQUESTED
			,EXEC_RESP_JUSTIF_DETERMIN_AMT,EXPT_QF_Q1_AMT_REQUESTED
			,EXPT_QF_Q1_JUSTIF_DETERMIN_AMT,EXPT_QF_Q2_AMT_REQUESTED
			,EXPT_QF_Q2_JUSTIF_DETERMIN_AMT,EXPT_QF_Q3_AMT_REQUESTED
			,EXPT_QF_Q3_JUSTIF_DETERMIN_AMT,EXPT_QF_Q4_AMT_REQUESTED
			,EXPT_QF_Q4_JUSTIF_DETERMIN_AMT,EXPT_QF_Q5_AMT_REQUESTED
			,EXPT_QF_Q5_JUSTIF_DETERMIN_AMT,TOTAL_AMT_EXPT_QUALIFICATIONS
			,CURRENT_PAY_GRADE,CURRENT_PAY_STEP,CURRENT_PAY_POSITION_TITLE
			,CURRENT_PAY_TABLE,CURRENT_PAY_TIER,CLINICAL_SPECIALTY_BOARD_CERT
			,OTHER_SPECIALTY,CURRENT_PAY_RECRUITMENT,CURRENT_PAY_RELOCATION
			,CURRENT_PAY_RETENTION,CURRENT_PAY_3R_TOTAL,CURRENT_PAY_BASE
			,CURRENT_PAY_LOCALITY_MARKET,CURRENT_PAY_TOTAL_ANNUAL_PAY
			,CURRENT_PAY_TOTAL_COMPENSATION,CURRENT_PAY_NOTES,PROPOSED_PAY_STEP
			,PROPOSED_PAY_TABLE,PROPOSED_PAY_TIER,PROPOSED_PAY_RECRUITMENT
			,PROPOSED_PAY_RELOCATION,PROPOSED_PAY_RETENTION,PROPOSED_PAY_TOTAL_3R
			,PROPOSED_GS_BASE_PAY,PROPOSED_MARKET_PAY,PROPOSED_TOTAL_ANNUAL_PAY
			,PROPOSED_TOTAL_ANNUAL_COMPENS,INCENTIVES_APPROVED_BY_TABG
			,PROPOSED_PAY_NOTES,DATE_OF_MEETING,PANEL_MEMBER_NAME
			,PANEL_MEMBER_COMPONENT,PANEL_ROLE,VOTING_STATUS
			,PANEL_RECOMMENDED_COMPENSATION,QUORUM_REACHED
			,PANEL_CURRENT_SALARY,PANEL_PDP_AMOUNT,PANEL_RECOMM_ANNUAL_SALARY
			,SELECTING_OFFICIAL_REVIEWER,SELECTING_OFFICIAL_REVIEW_DT
			,TABG_DIVISION_DIR_REVIEW_DT,CMS_CHIEF_PHYSICIAN_REVIEW_DT
			,OFM_REVIEW_DATE,TABG_REVIEW_DATE,OHC_REVIEW_DATE,ADMINISTRATOR_APPROVAL_DATE)
			SELECT PROC_ID,PDP_TYPE,PDP_TYPE_OTHER,EXISTINGREQUEST,WORK_SCHEDULE
			,HOURS_PER_WEEK,BD_CERT_REQ,LIC_INFO,MARKET_PAY_RATE
			,CURRENT_FED_EMPLOYEE,LEVEL_RESPONSIBILITY,EXEC_RESP_AMT_REQUESTED
			,EXEC_RESP_JUSTIF_DETERMIN_AMT,EXPT_QF_Q1_AMT_REQUESTED
			,EXPT_QF_Q1_JUSTIF_DETERMIN_AMT,EXPT_QF_Q2_AMT_REQUESTED
			,EXPT_QF_Q2_JUSTIF_DETERMIN_AMT,EXPT_QF_Q3_AMT_REQUESTED
			,EXPT_QF_Q3_JUSTIF_DETERMIN_AMT,EXPT_QF_Q4_AMT_REQUESTED
			,EXPT_QF_Q4_JUSTIF_DETERMIN_AMT,EXPT_QF_Q5_AMT_REQUESTED
			,EXPT_QF_Q5_JUSTIF_DETERMIN_AMT,TOTAL_AMT_EXPT_QUALIFICATIONS
			,CURRENT_PAY_GRADE,CURRENT_PAY_STEP,CURRENT_PAY_POSITION_TITLE
			,CURRENT_PAY_TABLE,CURRENT_PAY_TIER,CLINICAL_SPECIALTY_BOARD_CERT
			,OTHER_SPECIALTY,CURRENT_PAY_RECRUITMENT,CURRENT_PAY_RELOCATION
			,CURRENT_PAY_RETENTION,CURRENT_PAY_3R_TOTAL,CURRENT_PAY_BASE
			,CURRENT_PAY_LOCALITY_MARKET,CURRENT_PAY_TOTAL_ANNUAL_PAY
			,CURRENT_PAY_TOTAL_COMPENSATION,CURRENT_PAY_NOTES,PROPOSED_PAY_STEP
			,PROPOSED_PAY_TABLE,PROPOSED_PAY_TIER,PROPOSED_PAY_RECRUITMENT
			,PROPOSED_PAY_RELOCATION,PROPOSED_PAY_RETENTION,PROPOSED_PAY_TOTAL_3R
			,PROPOSED_GS_BASE_PAY,PROPOSED_MARKET_PAY,PROPOSED_TOTAL_ANNUAL_PAY
			,PROPOSED_TOTAL_ANNUAL_COMPENS,INCENTIVES_APPROVED_BY_TABG
			,PROPOSED_PAY_NOTES,DATE_OF_MEETING,PANEL_MEMBER_NAME
			,PANEL_MEMBER_COMPONENT,PANEL_ROLE,VOTING_STATUS
			,PANEL_RECOMMENDED_COMPENSATION,QUORUM_REACHED
			,PANEL_CURRENT_SALARY,PANEL_PDP_AMOUNT,PANEL_RECOMM_ANNUAL_SALARY
			,SELECTING_OFFICIAL_REVIEWER,SELECTING_OFFICIAL_REVIEW_DT
			,TABG_DIVISION_DIR_REVIEW_DT,CMS_CHIEF_PHYSICIAN_REVIEW_DT
			,OFM_REVIEW_DATE,TABG_REVIEW_DATE,OHC_REVIEW_DATE,ADMINISTRATOR_APPROVAL_DATE
			FROM VW_INCENTIVES_PDP WHERE PROC_ID = I_PROCID;
	END IF;

	EXCEPTION
	WHEN OTHERS THEN
		SP_ERROR_LOG();
END;
/

GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_PDP_TABLE TO HHS_CMS_HR_RW_ROLE;
GRANT EXECUTE ON HHS_CMS_HR.SP_UPDATE_INCENTIVES_PDP_TABLE TO HHS_CMS_HR_DEV_ROLE;
