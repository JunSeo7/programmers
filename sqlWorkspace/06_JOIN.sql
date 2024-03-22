-- JOIN

/*
    <JOIN>
        �� ���� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ����ϴ� �����̴�.
        
        1. � ����(EQUAL JOIN) / ���� ����(INNER JOIN)
            �����Ű�� Į���� ���� ��ġ�ϴ� ��鸸 ���εǼ� ��ȸ�Ѵ�.(��ġ�ϴ� ���� ���� ���� ��ȸ X)
            
            1) ����Ŭ ���� ����
                [����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1, ���̺�2
                    WHERE ���̺�1.Į���� = ���̺�2.Į����;
                
                - FROM ���� ��ȸ�ϰ��� �ϴ� ���̺���� �޸�(,)�� �����Ͽ� �����Ѵ�.
                - WHERE ���� ��Ī ��ų Į���� ���� ������ �����Ѵ�.
            
            2) ANSI ǥ�� ����
                [����]
                    SELECT Į��, Į��, ...
                    FROM ���̺�1
                    [INNER] JOIN ���̺�2 ON (���̺�1.Į���� = ���̺�2.Į����);
                
                - FROM ���� ������ �Ǵ� ���̺��� ����Ѵ�.
                - JOIN ���� ���� ��ȸ�ϰ��� �ϴ� ���̺��� ��� �� ��Ī ��ų Į���� ���� ������ ����Ѵ�.
                - ���ῡ ����Ϸ��� Į������ ���� ��� ON ���� ��ſ� USING(Į����) ������ ����Ѵ�.
*/
-- �����, �����ڵ�, ���޸� ��ȸ
SELECT 
    EMP_NAME
    , ABC.JOB_CODE
    , JOB_NAME
FROM EMPLOYEE ABC
JOIN JOB X ON ABC.JOB_CODE = X.JOB_CODE
;

-- �μ��� �޿� �հ�
SELECT 
    D.DEPT_TITLE
    , SUM(E.SALARY)
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID 
WHERE E.DEPT_CODE != 'D5'
GROUP BY D.DEPT_TITLE
;

-------------------------------------------------------------------

-- EMPLOYEE ���̺�. JOB ���̺��� �̿��Ͽ�
-- �����, �����ڵ�, ���޸� ��ȸ,
SELECT 
    EMP_NAME
    , E.JOB_CODE
    , JOB_NAME
FROM EMPLOYEE E
JOIN JOB J 
ON E.JOB_CODE = J.JOB_CODE
;

-- EMPLOYEE ���̺� , DEPARTMENT ���̺��� �̿��Ͽ�
-- �����, �μ��ڵ�, �μ��� ��ȸ
SELECT 
    EMP_NAME
    , E.DEPT_CODE
    , DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
;

-- DEPARTMENT ���̺� , LOCATION ���̺��� �̿��Ͽ�
-- �μ��ڵ�, �μ���, �����ڵ�, ������, �����ڵ� ��ȸ
SELECT 
    D.DEPT_ID
    , D.DEPT_TITLE
    , D.LOCATION_ID
    , L.LOCAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
;

-- LOCATION ���̺� , NATIONAL ���̺��� �̿��Ͽ�
-- �����ڵ�, ������, �����ڵ�, ������ ��ȸ
SELECT 
    L.LOCAL_CODE
    , L.LOCAL_NAME
    , L.NATIONAL_CODE
    , N.NATIONAL_NAME
FROM LOCATION L 
JOIN NATIONAL N 
ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

-- DEPARTMENT ���̺� , LOCATION ���̺� , NATIONAL ���̺��� �̿��Ͽ�
-- �μ��ڵ�, �μ���, ������, ������ ��ȸ
SELECT 
    D.DEPT_ID
    , D.DEPT_TITLE
    , L.LOCAL_NAME
    , N.NATIONAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE 
JOIN NATIONAL N 
ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

-- DEPARTMENT ���̺�, -- EMPLOYEE ���̺�
-- �����, �μ���

SELECT EMP_NAME, D.DEPT_ID, DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;

/*
    3. �ܺ� ���� (OUTTER JOIN)
        ���̺� ���� JOIN �� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ�� �����ϴ�.
        ��, �ݵ�� �����̵Ǵ� ���̺�(�÷�)�� �����ؾ� �Ѵ�. (LEFT/RIGHT/(+))
*/

SELECT EMP_NAME, D.DEPT_ID, DEPT_TITLE
FROM EMPLOYEE E
FULL JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
;

/*
    4. ī�׽þȰ�(CARTESIAN PRODUCT) / ���� ����(CROSS JOIN)
        ���εǴ� ��� ���̺��� �� ����� ���μ��� ��� ���ε� �����Ͱ� �˻��ȴ�.
        ���̺��� ����� ��� ������ ����� ������ ��� -> ����ȭ�� ����
*/

SELECT EMP_NAME, E.DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE E
CROSS JOIN DEPARTMENT
;

/*
    5. �� ����(NON EQUAL JOIN)
        ���� ���ǿ� ��ȣ(=)�� ������� �ʴ� ���ι��� �� �����̶�� �Ѵ�.
        ������ Į�� ���� ��ġ�ϴ� ��찡 �ƴ�, ���� ������ ���ԵǴ� ����� �����ϴ� ����̴�.
        ( = �̿ܿ� �� ������ >, <, >=, <=, BETWEEN AND, IN, NOT IN ���� ����Ѵ�.)
        ANSI �������δ� JOIN ON �������θ� ����� �����ϴ�. (USING ��� �Ұ�)
*/

SELECT EMP_NAME, SALARY , S.*
FROM EMPLOYEE  E
JOIN SAL_GRADE S 
ON E.SALARY >= S.MIN_SAL AND E.SALARY < S.MAX_SAL;

/*
    6. ��ü ����(SELF JOIN)
        ���� ���̺��� �ٽ� �ѹ� �����ϴ� ��쿡 ����Ѵ�.
*/


SELECT 
    E.EMP_ID
    , E.EMP_NAME
    , E.MANAGER_ID
    , D.EMP_NAME
FROM EMPLOYEE E
JOIN EMPLOYEE D ON E.MANAGER_ID = D.EMP_ID
;
SELECT 
    E.EMP_ID
    , E.EMP_NAME
    , E.MANAGER_ID
    , D.EMP_NAME
FROM EMPLOYEE E
JOIN EMPLOYEE D ON E.MANAGER_ID = D.EMP_ID;

---------------- �ǽ� ���� ----------------

-- 1. DEPARTMENT ���̺�� LOCATION ���̺��� �����Ͽ� 
--    �μ� �ڵ�, �μ���, ���� �ڵ�, �������� ��ȸ
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCAL_NAME
FROM DEPARTMENT D
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
;

-- 2. EMPLOYEE ���̺�� DEPARTMENT ���̺��� 
--    �����ؼ� ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ����� ��ȸ
SELECT E.EMP_ID, E.EMP_NAME, SALARY*BONUS, D.DEPT_TITLE
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID AND E.BONUS IS NOT NULL
ORDER BY SALARY*BONUS DESC
;

-- 3. EMPLOYEE ���̺�� DEPARTMENT ���̺��� �����ؼ� 
--    �λ�����ΰ� �ƴ� ������� �����, �μ���, �޿��� ��ȸ
SELECT EMP_NAME, D.DEPT_TITLE, SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID 
AND D.DEPT_ID != 'D1'
;

-- 4. EMPLOYEE ���̺�, DEPARTMENT ���̺�, LOCATION 
--    ���̺��� �����ؼ� ���, �����, �μ���, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
;

-- 5. ���, �����, �μ���, ������, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, D.DEPT_TITLE, L.LOCAL_NAME, N.NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N 
ON L.NATIONAL_CODE = N.NATIONAL_CODE
;

-- 6. ���, �����, �μ���, ������, ������, �޿� ��� ��ȸ 
SELECT 
    EMP_ID
    , EMP_NAME
    , D.DEPT_TITLE
    , L.LOCAL_NAME
    , N.NATIONAL_NAME
    , SAL_LEVEL
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N 
ON L.NATIONAL_CODE = N.NATIONAL_CODE
JOIN SAL_GRADE S 
ON E.SALARY >= S.MIN_SAL AND E.SALARY < S.MAX_SAL
;


-- 1. ������ �븮�̸鼭 ASIA �������� �ٹ��ϴ� �������� 
--    ���, �����, ���޸�, �μ���, �ٹ�����, �޿��� ��ȸ�ϼ���.
SELECT 
    EMP_ID
    , EMP_NAME
    , J.JOB_NAME
    , D.DEPT_TITLE
    , LOCAL_NAME
    , SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J 
ON E.JOB_CODE = J.JOB_CODE
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N 
ON L.NATIONAL_CODE = N.NATIONAL_CODE
AND L.LOCAL_NAME LIKE '%ASIA%' AND J.JOB_NAME = '�븮' 
;

-- 2. 70���� �̸鼭 �����̰�, ���� �� ���� �������� 
--    �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�ϼ���.
SELECT EMP_NAME, EMP_NO, D.DEPT_TITLE, J.JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J 
ON E.JOB_CODE = J.JOB_CODE
AND SUBSTR(EMP_NO,1,1) = 7
AND SUBSTR(EMP_NO,8,1) = 2
;

-- 3. ���ʽ��� �޴� �������� �����, ���ʽ�, ����, �μ���, �ٹ������� ��ȸ�ϼ���.
SELECT EMP_NAME, BONUS*SALARY, SALARY, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
AND E.BONUS IS NOT NULL
;

-- 4. �ѱ��� �Ϻ����� �ٹ��ϴ� �������� �����, �μ���, �ٹ�����, �ٹ� ������ ��ȸ�ϼ���.
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL N 
ON L.NATIONAL_CODE = N.NATIONAL_CODE
AND NATIONAL_NAME IN('�Ϻ�','�ѱ�')
;

-- 5. �� �μ��� ��� �޿��� ��ȸ�Ͽ� �μ���, ��� �޿�(���� ó��)�� ��ȸ�ϼ���.
SELECT D.DEPT_TITLE, FLOOR(AVG(SALARY))
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
GROUP BY DEPT_TITLE
;

-- 6. �� �μ��� �� �޿��� ���� 1000���� �̻��� �μ���, �޿��� ���� ��ȸ�Ͻÿ�.
SELECT D.DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE E
JOIN DEPARTMENT D
ON E.DEPT_CODE = D.DEPT_ID
GROUP BY D.DEPT_TITLE 
HAVING SUM(SALARY) >= 10000000
;

-- 7. ���, �����, ���޸�, �޿� ���, ������ ��ȸ
--    �̶� ���п� �ش��ϴ� ���� �Ʒ��� ���� ��ȸ �ǵ��� �Ͻÿ�.
--    �޿� ����� S1, S2�� ��� '���'
--    �޿� ����� S3, S4�� ��� '�߱�'
--    �޿� ����� S5, S6�� ��� '�ʱ�'
SELECT EMP_ID, EMP_NAME, JOB_NAME, SAL_LEVEL, CASE 
    WHEN SAL_LEVEL IN ('S1','S2') THEN '���'
    WHEN SAL_LEVEL IN ('S3','S4') THEN '�߱�'
    ELSE '�ʱ�'
    END ����
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
JOIN SAL_GRADE S 
ON E.SALARY >= S.MIN_SAL AND E.SALARY < S.MAX_SAL
;

-- 8. ���ʽ��� ���� �ʴ� ������ �� ���� �ڵ尡 J4 �Ǵ� J7�� �������� 
--    �����, ���޸�, �޿��� ��ȸ�Ͻÿ�.
SELECT EMP_NAME, J.JOB_CODE, JOB_NAME, SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
JOIN SAL_GRADE S 
ON E.SALARY >= S.MIN_SAL AND E.SALARY < S.MAX_SAL
AND J.JOB_CODE IN ('J4','J7')
;

SELECT E.EMP_NAME AS "�����", 
       J.JOB_NAME AS "���޸�", 
       E.SALARY AS "�޿�"
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE E.BONUS IS NULL
  AND E.JOB_CODE IN ('J4', 'J7');

-- 9. �μ��� �ִ� �������� �����, ���޸�, �μ���, �ٹ� ������ ��ȸ�Ͻÿ�.
SELECT EMP_NAME, J.JOB_NAME, D.DEPT_TITLE, L.LOCAL_NAME
FROM EMPLOYEE E
JOIN JOB J 
ON E.JOB_CODE = J.JOB_CODE
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID 
JOIN LOCATION L 
ON D.LOCATION_ID = L.LOCAL_CODE
;

-- 10. �ؿܿ������� �ٹ��ϴ� �������� �����, ���޸�, �μ� �ڵ�, �μ����� ��ȸ�Ͻÿ�
SELECT EMP_NAME, JOB_NAME, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID 
AND D.DEPT_ID IN ('D5','D6','D7')
;

-- 11. �̸��� '��'�ڰ� ����ִ� �������� ���, �����, ���޸��� ��ȸ�Ͻÿ�.
SELECT E.EMP_ID, E.EMP_NAME, J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J 
ON E.JOB_CODE = J.JOB_CODE
AND EMP_NAME LIKE '%��%'
;
