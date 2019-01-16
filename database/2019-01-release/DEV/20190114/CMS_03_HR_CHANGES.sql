ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_PROPOSAL_NEGOTIABLE TO LN_PROPOSAL_NEGOTIABLE;

ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN  
  LN_UNION_NON_NEGOTIABLE_LETTER TO LN_NON_NEGOTIABLE_LETTER;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_FILE_ULP TO LN_FILE_ULP;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_LETTER_PROVIDED TO LN_LETTER_PROVIDED;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_NEGOTIABLE_PROPOSAL TO LN_NEGOTIABLE_PROPOSAL;

ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_BARGAINING_BEGAN_DT TO LN_BARGAINING_BEGAN_DT;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_IMPASSE_DT TO LN_IMPASSE_DT;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_FSIP_DECISION_DT TO LN_FSIP_DECISION_DT;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_BARGAINING_END_DT TO LN_BARGAINING_END_DT;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_SUMMARY_OF_ISSUE TO LN_SUMMARY_OF_ISSUE;

ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_SECON_LETTER_REQUEST TO LN_SECON_LETTER_REQUEST;
  
ALTER TABLE
  ERLR_LABOR_NEGO
RENAME COLUMN
  LN_UNION_NEGO_ISSUE_SUMMARY TO LN_NEGOTIABL_ISSUE_SUMMARY;
  
ALTER TABLE
  ERLR_LABOR_NEGO
ADD
(
  LN_BRIEFING_DT  DATE,
  LN_2ND_PROVIDED_DT  DATE,
  LN_BRIEFING_REQUESTED2_DT DATE
);
  
COMMIT;



--------------------------------------------------------
--  DDL for VW_ERLR_LABOR_NEGO
--------------------------------------------------------
CREATE OR REPLACE VIEW VW_ERLR_LABOR_NEGO
AS
SELECT
    LN.ERLR_CASE_NUMBER
    , EC.ERLR_JOB_REQ_NUMBER
    , EC.PROCID    
    , EC.ERLR_CASE_CREATE_DT
    , LN_NEGOTIATION_TYPE	
    , LN_INITIATOR
	, LN_DEMAND2BARGAIN_DT
	, LN_BRIEFING_REQUEST
	, LN_PROPOSAL_SUBMISSION_DT
	, LN_PROPOSAL_SUBMISSION
	, LN_PROPOSAL_NEGOTIABLE
	, LN_NON_NEGOTIABLE_LETTER
	, LN_FILE_ULP
	, LN_PROPOSAL_INFO_GROUND_RULES
	, LN_PRPSAL_INFO_NEG_COMMENCE_DT
	, LN_LETTER_PROVIDED
	, LN_LETTER_PROVIDED_DT
	, LN_NEGOTIABLE_PROPOSAL
	, LN_BARGAINING_BEGAN_DT
	, LN_IMPASSE_DT
	, LN_FSIP_DECISION_DT
	, LN_BARGAINING_END_DT
	, LN_AGREEMENT_DT
	, LN_SUMMARY_OF_ISSUE
	, LN_SECON_LETTER_REQUEST
	, LN_2ND_LETTER_PROVIDED
	, LN_NEGOTIABL_ISSUE_SUMMARY
	, LN_MNGMNT_ARTICLE4_NTC_DT
	, LN_MNGMNT_NOTICE_RESPONSE
	, LN_MNGMNT_BRIEFING_REQUEST
	, LN_MNGMNT_BARGAIN_SBMSSION_DT
	, LN_MNGMNT_PROPOSAL_SBMSSION

FROM
	ERLR_LABOR_NEGO LN
    LEFT OUTER JOIN ERLR_CASE EC ON LN.ERLR_CASE_NUMBER = EC.ERLR_CASE_NUMBER
;
/


ALTER TABLE ERLR_EMPLOYEE_CASE 
ADD (CASE_TYPE_ID NUMBER(10) );

ALTER TABLE ERLR_EMPLOYEE_CASE 
ADD (CASE_TYPE_NAME VARCHAR2(100) );

ALTER TABLE ERLR_EMPLOYEE_CASE 
ADD (EMP_FIRST_NAME VARCHAR2(100) );

ALTER TABLE ERLR_EMPLOYEE_CASE 
ADD (EMP_LAST_NAME VARCHAR2(100) );


CREATE OR REPLACE FORCE VIEW VW_ERLR_EMPLOYEE_CASE AS 
  SELECT * 
    FROM ERLR_EMPLOYEE_CASE     
  ORDER BY CASEID;
/

create or replace PROCEDURE SP_ERLR_EMPLOYEE_CASE_ADD
(
	I_HHSID IN VARCHAR2,
	I_CASEID IN NUMBER,
    I_CASE_TYPE_ID IN NUMBER,
	I_FROM_CASEID IN NUMBER,
	I_MEMBER_ID IN VARCHAR2 -- MANUALLY ENTERED CASE IF THIS VALUE IS NOT NULL
)
IS
    V_CNT NUMBER;
    V_CASE_TYPE_NAME VARCHAR2(100);
BEGIN
    SELECT COUNT(*)
      INTO V_CNT
      FROM ERLR_EMPLOYEE_CASE
     WHERE HHSID = I_HHSID
       AND CASEID = I_CASEID;

    IF 0=V_CNT THEN
        SELECT TBL_LABEL
          INTO V_CASE_TYPE_NAME
          FROM TBL_LOOKUP
         WHERE TBL_ID = I_CASE_TYPE_ID;
    
        IF I_MEMBER_ID IS NULL THEN
            INSERT INTO ERLR_EMPLOYEE_CASE(HHSID, CASEID, FROM_CASEID, CASE_TYPE_ID, CASE_TYPE_NAME, EMP_LAST_NAME, EMP_FIRST_NAME)
            SELECT I_HHSID, I_CASEID, I_FROM_CASEID, I_CASE_TYPE_ID, V_CASE_TYPE_NAME, LAST_NAME, FIRST_NAME
              FROM HHS_HR.EMPLOYEE_LOOKUP
             WHERE HHSID = I_HHSID;
        ELSE
            INSERT INTO ERLR_EMPLOYEE_CASE(HHSID, CASEID, FROM_CASEID, CASE_TYPE_ID, CASE_TYPE_NAME, EMP_LAST_NAME, EMP_FIRST_NAME, M_DT, M_MEMBER_ID, M_MEMBER_NAME)
            SELECT I_HHSID, I_CASEID, I_FROM_CASEID, I_CASE_TYPE_ID, V_CASE_TYPE_NAME, LAST_NAME, FIRST_NAME, CAST(SYS_EXTRACT_UTC(SYSTIMESTAMP) AS DATE), I_MEMBER_ID, M.NAME
              FROM BIZFLOW.MEMBER M, HHS_HR.EMPLOYEE_LOOKUP E
             WHERE M.MEMBERID = I_MEMBER_ID
               AND E.HHSID = I_HHSID;
        END IF;
    END IF;

EXCEPTION
	WHEN OTHERS THEN
		SP_ERROR_LOG();
END;
/

create or replace PROCEDURE SP_INIT_ERLR
(
	I_PROCID               IN  NUMBER
)
IS
    V_CNT                   INT;    
    V_FROM_PROCID           NUMBER(10);
    V_XMLDOC                XMLTYPE;    
    V_ORG_CASE_NUMBER       NUMBER(10);
    V_CASE_NUMBER           NUMBER(10);    
    V_GEN_EMP_HHSID         VARCHAR2(64);
    V_NEW_CASE_TYPE_ID	    NUMBER(38);
    V_NEW_CASE_TYPE_NAME    VARCHAR2(100);
BEGIN
    SELECT COUNT(1) INTO V_CNT
      FROM TBL_FORM_DTL
     WHERE PROCID = I_PROCID;

    IF V_CNT = 0 THEN
        V_CASE_NUMBER :=  ERLR_CASE_NUMBER_SEQ.NEXTVAL;
        UPDATE BIZFLOW.RLVNTDATA 
           SET VALUE = V_CASE_NUMBER
         WHERE RLVNTDATANAME = 'caseNumber' 
           AND PROCID = I_PROCID;
        
        -- CHECK: TRIGGERED FROM OTHER CASE
        BEGIN
            SELECT TO_NUMBER(VALUE)
              INTO V_FROM_PROCID
              FROM BIZFLOW.RLVNTDATA 
             WHERE RLVNTDATANAME = 'fromProcID' 
               AND PROCID = I_PROCID;
        EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            V_FROM_PROCID := NULL;
        END;
        
        IF V_FROM_PROCID IS NOT NULL THEN
            SELECT FIELD_DATA
              INTO V_XMLDOC
              FROM TBL_FORM_DTL
             WHERE PROCID = V_FROM_PROCID;

            SELECT TO_NUMBER(VALUE)
              INTO V_NEW_CASE_TYPE_ID
              FROM BIZFLOW.RLVNTDATA 
             WHERE RLVNTDATANAME = 'caseTypeID' 
               AND PROCID = I_PROCID;

            SELECT TO_NUMBER(VALUE)
              INTO V_ORG_CASE_NUMBER
              FROM BIZFLOW.RLVNTDATA 
             WHERE RLVNTDATANAME = 'caseNumber' 
               AND PROCID = V_FROM_PROCID;

            BEGIN
              SELECT TBL_LABEL
                INTO V_NEW_CASE_TYPE_NAME
                FROM TBL_LOOKUP
               WHERE TBL_ID = V_NEW_CASE_TYPE_ID;
            EXCEPTION
              WHEN NO_DATA_FOUND THEN
              V_NEW_CASE_TYPE_NAME := TO_CHAR(V_NEW_CASE_TYPE_ID);
              WHEN OTHERS THEN
              V_NEW_CASE_TYPE_NAME := TO_CHAR(V_NEW_CASE_TYPE_ID);
            END;

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = (SELECT VALUE FROM BIZFLOW.RLVNTDATA WHERE RLVNTDATANAME='employeeName' AND PROCID = V_FROM_PROCID)
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='employeeName';

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = (SELECT VALUE FROM BIZFLOW.RLVNTDATA WHERE RLVNTDATANAME='contactName' AND PROCID = V_FROM_PROCID)
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='contactName';

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = (SELECT VALUE FROM BIZFLOW.RLVNTDATA WHERE RLVNTDATANAME='initialContactDate' AND PROCID = V_FROM_PROCID)
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='initialContactDate';

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = (SELECT VALUE FROM BIZFLOW.RLVNTDATA WHERE RLVNTDATANAME='organization' AND PROCID = V_FROM_PROCID)
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='organization';

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = (SELECT VALUE FROM BIZFLOW.RLVNTDATA WHERE RLVNTDATANAME='primaryDWCSpecialist' AND PROCID = V_FROM_PROCID)
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='primaryDWCSpecialist';

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = (SELECT VALUE FROM BIZFLOW.RLVNTDATA WHERE RLVNTDATANAME='secondaryDWCSpecialist' AND PROCID = V_FROM_PROCID)
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='secondaryDWCSpecialist';

            UPDATE BIZFLOW.RLVNTDATA
               SET VALUE = V_NEW_CASE_TYPE_NAME
             WHERE PROCID = I_PROCID
               AND RLVNTDATANAME='caseType';

            SELECT XMLQUERY('/formData/items/item[id="GEN_EMPLOYEE_ID"]/value/text()' PASSING V_XMLDOC RETURNING CONTENT).GETSTRINGVAL() INTO V_GEN_EMP_HHSID FROM DUAL;
            SELECT DELETEXML(V_XMLDOC,'/formData/items/item/id[not(contains(text(),"GEN_"))]/..') INTO V_XMLDOC FROM DUAL;
            SELECT DELETEXML(V_XMLDOC,'/formData/items/item[id="GEN_CASE_CATEGORY"]') INTO V_XMLDOC FROM DUAL;
            SELECT DELETEXML(V_XMLDOC,'/formData/items/item[id="GEN_CASE_DESC"]') INTO V_XMLDOC FROM DUAL;
            SELECT DELETEXML(V_XMLDOC,'/formData/items/item[id="GEN_CASE_STATUS"]') INTO V_XMLDOC FROM DUAL;
            SELECT DELETEXML(V_XMLDOC,'/formData/items/item[id="GEN_CUST_INIT_CONTACT_DT"]') INTO V_XMLDOC FROM DUAL;
            
            IF V_NEW_CASE_TYPE_ID IS NOT NULL AND V_NEW_CASE_TYPE_NAME IS NOT NULL THEN
                SELECT UPDATEXML(V_XMLDOC,'/formData/items/item[id="GEN_CASE_TYPE"]/value/text()', V_NEW_CASE_TYPE_ID) INTO V_XMLDOC FROM DUAL;
                SELECT UPDATEXML(V_XMLDOC,'/formData/items/item[id="GEN_CASE_TYPE"]/text/text()',  V_NEW_CASE_TYPE_NAME) INTO V_XMLDOC FROM DUAL;                
            END IF;
        END IF;        
        
        IF V_XMLDOC IS NULL THEN
            V_XMLDOC := XMLTYPE('<formData xmlns=""><items><item><id>CASE_NUMBER</id><etype>variable</etype><value>'|| V_CASE_NUMBER ||'</value></item></items><history><item /></history></formData>');
        ELSE
            SP_ERLR_EMPLOYEE_CASE_ADD(V_GEN_EMP_HHSID, V_CASE_NUMBER, TO_NUMBER(V_NEW_CASE_TYPE_ID), V_ORG_CASE_NUMBER, NULL);            
            SELECT APPENDCHILDXML(V_XMLDOC, '/formData/items', XMLTYPE('<item><id>CASE_NUMBER</id><etype>variable</etype><value>'|| V_CASE_NUMBER ||'</value></item>')) INTO V_XMLDOC FROM DUAL;            
        END IF;
        
        INSERT INTO TBL_FORM_DTL (PROCID, ACTSEQ, WITEMSEQ, FORM_TYPE, FIELD_DATA, CRT_DT, CRT_USR)
                          VALUES (I_PROCID, 0, 0, 'CMSERLR', V_XMLDOC, SYSDATE, 'System');
    END IF;

EXCEPTION
	WHEN OTHERS THEN
		SP_ERROR_LOG();
END;
/

create or replace PROCEDURE SP_FINALIZE_ERLR
(
	I_PROCID               IN  NUMBER
)
IS
    V_CNT                   INT;
    V_XMLDOC                XMLTYPE;
    V_XMLVALUE              XMLTYPE;
    V_CASE_TYPE_ID          VARCHAR2(10);
    V_VALUE                 VARCHAR2(100);
    V_NEW_CASE_TYPE_ID      VARCHAR2(10);
    V_NEW_CASE_TYPE_NAME    VARCHAR2(100);
    V_GEN_EMP_ID            VARCHAR2(64);
    V_CASE_NUMBER           NUMBER(10);
    V_TRIGGER_NEW_CASE      BOOLEAN := FALSE;
    YES                     CONSTANT VARCHAR2(3) := 'Yes';
    CONDUCT_ISSUE_ID		CONSTANT VARCHAR2(10) :='743';
    CONDUCT_ISSUE			CONSTANT VARCHAR2(50) :='Conduct Issue';
    GRIEVANCE_ID			CONSTANT VARCHAR2(10) :='745';
    GRIEVANCE			    CONSTANT VARCHAR2(50) :='Grievance';
    INVESTIGATION_ID		CONSTANT VARCHAR2(10) :='744';
    INVESTIGATION			CONSTANT VARCHAR2(50) :='Investigation';
    LABOR_NEGOTIATION_ID	CONSTANT VARCHAR2(10) :='748';
    LABOR_NEGOTIATION		CONSTANT VARCHAR2(50) :='Labor Negotiation';
    MEDICAL_DOCUMENTATION_ID CONSTANT VARCHAR2(10) :='746';
    MEDICAL_DOCUMENTATION	CONSTANT VARCHAR2(50) :='Medical Documentation';
    PERFORMANCE_ISSUE_ID	CONSTANT VARCHAR2(10) :='750';
    PERFORMANCE_ISSUE		CONSTANT VARCHAR2(50) :='Performance Issue';
    PROBATIONARY_PERIOD_ID	CONSTANT VARCHAR2(10) :='751';
    PROBATIONARY_PERIOD		CONSTANT VARCHAR2(50) :='Probationary Period';
    UNFAIR_LABOR_PRACTICES_ID	CONSTANT VARCHAR2(10) :='754';
    UNFAIR_LABOR_PRACTICES	CONSTANT VARCHAR2(50) :='Unfair Labor Practices';
    WGI_DENIAL_ID			CONSTANT VARCHAR2(10) :='809';
    WGI_DENIAL			    CONSTANT VARCHAR2(50) :='Within Grade Increase Denial/Reconsideration';    
    INFORMATION_REQUEST_ID  CONSTANT VARCHAR2(10) := '747';    
    THIRD_PARTY_HEARING_ID  CONSTANT VARCHAR2(10) := '753';    
    THIRD_PARTY_HEARING     CONSTANT VARCHAR2(50) := 'Third Party Hearing';
    ACTION_TYPE_COUNSELING_ID CONSTANT VARCHAR2(10) := '785';
    ACTION_TYPE_PIP_ID      CONSTANT VARCHAR2(10) := '787';
    ACTION_TYPE_WNR_ID      CONSTANT VARCHAR2(10) := '790';    
    REASON_FMLA_ID          CONSTANT VARCHAR2(10) := '1650';
BEGIN
    SELECT FIELD_DATA
      INTO V_XMLDOC
      FROM TBL_FORM_DTL
     WHERE PROCID = I_PROCID;

    V_CASE_TYPE_ID := V_XMLDOC.EXTRACT('/formData/items/item[id="GEN_CASE_TYPE"]/value/text()').getStringVal();    
    V_GEN_EMP_ID   := V_XMLDOC.EXTRACT('/formData/items/item[id="GEN_EMPLOYEE_ID"]/value/text()').getStringVal();    
    V_CASE_NUMBER  := TO_NUMBER(V_XMLDOC.EXTRACT('/formData/items/item[id="CASE_NUMBER"]/value/text()').getStringVal());    
    SP_ERLR_EMPLOYEE_CASE_ADD(V_GEN_EMP_ID, V_CASE_NUMBER, TO_NUMBER(V_CASE_TYPE_ID), NULL, NULL);
    
    IF V_CASE_TYPE_ID = INFORMATION_REQUEST_ID THEN -- Information Request
        V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="IR_APPEAL_DENIAL"]/value/text()'); -- Did Requester Appeal Denial?
        IF V_XMLVALUE IS NOT NULL THEN
            V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        END IF;
        
        IF V_VALUE = YES THEN
            V_NEW_CASE_TYPE_ID   := THIRD_PARTY_HEARING_ID;
            UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
        END IF;
    ELSIF V_CASE_TYPE_ID = INVESTIGATION_ID THEN -- Investigation
        -- Triggering Conduct Case
        V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="I_MISCONDUCT_FOUND"]/value/text()'); --Was Misconduct Found?
        IF V_XMLVALUE IS NOT NULL THEN
            V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        END IF;
        
        IF V_VALUE = YES THEN
            V_NEW_CASE_TYPE_ID   := CONDUCT_ISSUE_ID;
            UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
        END IF;
    ELSIF V_CASE_TYPE_ID = MEDICAL_DOCUMENTATION_ID THEN -- Medical Documentation
        -- Triggering Grievance Case
        V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="MD_REQUEST_REASON"]/value/text()'); -- Reason for Request
        IF V_XMLVALUE IS NOT NULL THEN
            V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        END IF;
        
        IF V_VALUE = REASON_FMLA_ID THEN  -- FMLA      
            V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="MD_FMLA_GRIEVANCE"]/value/text()'); -- Did Employee File a Grievance?
            IF V_XMLVALUE IS NOT NULL THEN
                V_VALUE := V_XMLVALUE.GETSTRINGVAL();
            END IF;
            
            IF V_VALUE = YES THEN
                V_NEW_CASE_TYPE_ID   := GRIEVANCE_ID;
                UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
            END IF;
        END IF;
    ELSIF V_CASE_TYPE_ID = LABOR_NEGOTIATION_ID THEN -- Labor Negotiation
        -- Triggering Unfair Labor Practices Case
        V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="LN_FILE_ULP"]/value/text()');--Did Union File ULP?
        IF V_XMLVALUE IS NOT NULL THEN
            V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        END IF;
        
        IF V_VALUE = YES THEN        
            V_NEW_CASE_TYPE_ID   := UNFAIR_LABOR_PRACTICES_ID;
            UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
        END IF;        
    ELSIF V_CASE_TYPE_ID = PERFORMANCE_ISSUE_ID THEN -- Performance Issue
        V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="PI_ACTION_TYPE"]/value/text()');
        IF V_XMLVALUE IS NOT NULL THEN
            V_VALUE := V_XMLVALUE.GETSTRINGVAL();
        END IF;
        
        IF V_VALUE = ACTION_TYPE_COUNSELING_ID THEN -- Action Type: Counseling
            V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="PI_CNSL_GRV_DECISION"]/value/text()'); -- Did Employee File a Grievance?
            IF V_XMLVALUE IS NOT NULL THEN
                V_VALUE := V_XMLVALUE.GETSTRINGVAL();
            END IF;
            
            IF V_VALUE = YES THEN
                V_NEW_CASE_TYPE_ID   := GRIEVANCE_ID;
                UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
            END IF;
        ELSIF V_VALUE = ACTION_TYPE_PIP_ID THEN -- Action Type: PIP
            V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="PI_PIP_EMPL_GRIEVANCE"]/value/text()'); -- Did Employee File a Grievance?
            IF V_XMLVALUE IS NOT NULL THEN
                V_VALUE := V_XMLVALUE.GETSTRINGVAL();
            END IF;
            
            IF V_VALUE = YES THEN
                V_NEW_CASE_TYPE_ID   := GRIEVANCE_ID;
                UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
            END IF;
            
            V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="PI_WNR_WGI_WTHLD"]/value/text()'); --Was WGI Withheld?
            IF V_XMLVALUE IS NOT NULL THEN
                V_VALUE := V_XMLVALUE.GETSTRINGVAL();
            END IF;
            
            IF V_VALUE = YES THEN
                V_NEW_CASE_TYPE_ID   := WGI_DENIAL_ID;
                UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID2' AND PROCID = I_PROCID;
            END IF;
        ELSIF V_VALUE = ACTION_TYPE_WNR_ID THEN -- Action Type: Written Narrative Review
            V_XMLVALUE := V_XMLDOC.EXTRACT('/formData/items/item[id="PI_WNR_WGI_WTHLD"]/value/text()'); -- Was WGI Withheld?
            IF V_XMLVALUE IS NOT NULL THEN
                V_VALUE := V_XMLVALUE.GETSTRINGVAL();
            END IF;
            
            IF V_VALUE = YES THEN
                V_NEW_CASE_TYPE_ID   := WGI_DENIAL_ID;
                UPDATE BIZFLOW.RLVNTDATA SET VALUE = V_NEW_CASE_TYPE_ID WHERE RLVNTDATANAME = 'triggeringCaseTypeID1' AND PROCID = I_PROCID;
            END IF;        
        END IF;
    END IF;
    
EXCEPTION
	WHEN OTHERS THEN
		SP_ERROR_LOG();
END;
/

ALTER TABLE
  ERLR_INFO_REQUEST
ADD
(
  IR_NCMS_REQUESTER_MN  NVARCHAR2(50),
  IR_PROVIDE_DT DATE
);

COMMIT;

create or replace FUNCTION FN_GET_FINAL_ACTIONS
  (
    I_PROCID              IN  NVARCHAR2
  )
  RETURN NVARCHAR2
IS
  VAL VARCHAR2(200);
BEGIN
    SELECT 
      XMLQUERY('for $i in /formData/items/item[id="CC_FINAL_ACTION_SEL"]/value
                   return concat($i/value/text(), ",")' 
      PASSING field_data 
    RETURNING CONTENT).GETSTRINGVAL() 
    INTO VAL
    FROM TBL_FORM_DTL
    WHERE PROCID=I_PROCID;
   
    VAL := SUBSTR(VAL, 0, LENGTH(VAL)-1);
    DBMS_OUTPUT.PUT_LINE(VAL);
    RETURN VAL;
END;
/