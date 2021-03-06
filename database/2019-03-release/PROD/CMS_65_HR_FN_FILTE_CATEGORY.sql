CREATE OR REPLACE FUNCTION FN_FILTER_CATEGORY
  (
    I_CASE_NUMBER IN  NUMBER,
    I_FILTER IN VARCHAR2
  )
  RETURN NUMBER
IS
  V_RETURN_VAL    NUMBER(20);
  BEGIN
    SELECT COUNT(*) into V_RETURN_VAL FROM (
      SELECT * FROM (
          WITH T AS ( SELECT GEN_CASE_CATEGORY FROM HHS_CMS_HR.VW_ERLR_GEN WHERE ERLR_CASE_NUMBER = I_CASE_NUMBER)
          SELECT TRIM(REGEXP_SUBSTR(GEN_CASE_CATEGORY, '[^,]+', 1, LEVEL )) AS VAL
            FROM T
          CONNECT BY REGEXP_SUBSTR(GEN_CASE_CATEGORY, '[^,]+', 1, LEVEL ) IS NOT NULL
      )

      INTERSECT

      SELECT * FROM (
         WITH X AS ( SELECT I_FILTER AS FILTER FROM DUAL )
         SELECT TRIM(REGEXP_SUBSTR(FILTER, '[^,]+', 1, LEVEL )) AS VAL
           FROM X
         CONNECT BY REGEXP_SUBSTR(FILTER, '[^,]+', 1, LEVEL ) IS NOT NULL
        )
     );

    RETURN V_RETURN_VAL;
    EXCEPTION
    WHEN OTHERS THEN
    SP_ERROR_LOG();
    --DBMS_OUTPUT.PUT_LINE('ERROR occurred while executing FN_GET_2ND_SUB_ORG -------------------');
    --DBMS_OUTPUT.PUT_LINE('Error code    = ' || SQLCODE);
    --DBMS_OUTPUT.PUT_LINE('Error message = ' || SQLERRM);
    RETURN 0;
  END;
/




-- select HHS_CMS_HR.FN_FILTER_CATEGORY(10285, 'PIP2, OTHER') from dual

grant EXECUTE ON HHS_CMS_HR.FN_FILTER_CATEGORY TO BIZFLOW;
grant EXECUTE ON HHS_CMS_HR.FN_FILTER_CATEGORY TO HHS_CMS_HR_RW_ROLE;
grant EXECUTE ON HHS_CMS_HR.FN_FILTER_CATEGORY TO HHS_CMS_HR_DEV_ROLE;

