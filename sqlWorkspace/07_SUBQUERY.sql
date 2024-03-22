-- �������� (SUBQUERY)

/*
    <SUBQUERY>
        �ϳ��� SQL �� �ȿ� ���Ե� �� �ٸ� SQL ���� ���Ѵ�. 
        ���� ����(���� ����)�� �����ϴ� ������ �ϴ� �������̴�.
*/

-- ���ö ����� ���� �μ��� ��ȸ


SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 
(
    SELECT DEPT_CODE
    FROM EMPLOYEE
    WHERE EMP_NAME = '���ö'
)
;

/*
    <���� ���� ����>
        ���� ������ ���� ������ ������ ������� ��� ���� ������ ���� �з��� �� �ִ�.
        
        1) ������ ���Ͽ� ���� ����  : ���� ������ ��ȸ ��� ���� ��� ���� ������ 1�� �� ��
        2) ������ ���� ����        : ���� ������ ��ȸ ��� ���� ���� ������ ���� �� �� ��
        3) ���߿� ���� ����        : ���� ������ ��ȸ ��� ���� �� �������� Į���� ������ �϶�
        4) ������, ���߿� ���� ���� : ���� ������ ��ȸ ��� ���� ������, ������ �� ��
        
        * ���� ������ ������ ���� ���� ���� �տ� �ٴ� �����ڰ� �޶�����.
        
    <������ ���� ����>
        ���� ������ ��ȸ ��� ���� ��� ���� ������ 1�� �� �� (������, ���Ͽ�)
        �� ������(������ ������) ��� ���� (=, !=, <>, ^=, >, <, >=, <=, ...)
*/

-- 1) �� ������ ��� �޿����� �޿��� ���� �޴� �������� �̸�, ���� �ڵ�, �޿� ��ȸ

SELECT 
    EMP_NAME    �̸�
    , JOB_CODE  "���� �ڵ�"
    , SALARY    �޿�
FROM EMPLOYEE
WHERE SALARY <
(
    SELECT AVG(SALARY)
    FROM EMPLOYEE
)
;

-- 2) ���� �޿��� �޴� ������ ���, �̸�, ���� �ڵ�, �޿�, �Ի��� ��ȸ
SELECT 
    EMP_NAME    �̸�
    , JOB_CODE  "���� �ڵ�"
    , TO_CHAR(SALARY, '99,999,999') || '��'    �޿�
    , TO_CHAR(TO_DATE(HIRE_DATE),'YYYY-MM-DD') �Ի���
FROM EMPLOYEE
WHERE SALARY =
(
    SELECT MIN(SALARY)
    FROM EMPLOYEE
)
;

--3) ���ö ����� �޿����� �� ���� �޿��� �޴� �����
SELECT 
    EMP_ID
    , EMP_NAME
    , DEPT_TITLE
    , JOB_CODE
    , SALARY
FROM EMPLOYEE E
JOIN DEPARTMENT D 
ON E.DEPT_CODE = D.DEPT_ID
WHERE SALARY > 
(
    SELECT SALARY
    FROM EMPLOYEE
    WHERE EMP_NAME = '���ö'
)
;

-- 4) �μ��� �޿��� ���� ���� ū �μ��� �μ� �ڵ�, �޿��� �� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE  
GROUP BY DEPT_CODE 
HAVING SUM(SALARY) = 
(
    SELECT MAX(SUM(SALARY))
    FROM EMPLOYEE
    GROUP BY DEPT_CODE 
)
;

-- 5) ������ ����� �����ִ� �μ����� ��ȸ (��, ������ ����� ����)
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE =
(
    SELECT DEPT_CODE
    FROM EMPLOYEE
    WHERE EMP_NAME = '������'
) AND EMP_NAME NOT LIKE '������'
;

/*
    <������ ���� ����>
        ���� ������ ��ȸ ��� ���� ���� ������ ���� �� �� ��
        
        IN / NOT IN (���� ����) : ���� ���� ����� �߿��� �� ���� ��ġ�ϴ� ���� �ִٸ� Ȥ�� ���ٸ� TRUE�� �����Ѵ�.
        ANY : ���� ���� ���� �߿��� �� ���� �����ϸ� TRUE, IN�� �ٸ� ���� �� �����ڸ� �Բ� ����Ѵٴ� ���̴�. 
            ANY(100, 200, 300)
            SALARY = ANY(...)  : IN�� ���� ���
            SALARY != ANY(...) : NOT IN�� ���� ���
            SALARY > ANY(...)  : �ּҰ� ���� ũ�� TRUE
            SALARY < ANY(...)  : �ִ밪 ���� ������ TRUE
        ALL : ���� ���� ���� ��ο� ���Ͽ� �����ؾ� TRUE, IN�� �ٸ� ���� �� �����ڸ� �Բ� ����Ѵٴ� ���̴�.
            ALL(100, 200, 300)
            SALARY > ALL(...)  : �ִ밪 ���� ũ�� TRUE
            SALARY < ALL(...)  : �ּҰ� ���� ������ TRUE
*/

-- 1) �� �μ��� �ְ� �޿��� �޴� ������ �̸�, ���� �ڵ�, �μ� �ڵ�, �޿� ��ȸ
SELECT 
    EMP_NAME
    , JOB_CODE
    , DEPT_CODE
    , SALARY
FROM EMPLOYEE
WHERE SALARY IN
(
    SELECT MAX(SALARY) 
    FROM EMPLOYEE
    GROUP BY DEPT_CODE
)
;

-- 2) �� �����鿡 ���� ���, �̸�, �μ� �ڵ�, ����(���/���)
SELECT 
    EMP_ID
    , EMP_NAME
    , DEPT_CODE 
    , CASE 
        WHEN EMP_ID IN (
                        SELECT DISTINCT(MANAGER_ID)
                        FROM EMPLOYEE
                        WHERE MANAGER_ID IS NOT NULL
                        ) THEN '���'
        ELSE '���'
    END ����
FROM EMPLOYEE
ORDER BY ����
;

-- 3) �븮 �����ӿ��� ���� ���޵��� �ּ� �޿����� ���� �޴� ������ 
--    ���, �̸�, ���޸�, �޿� ��ȸ
SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '�븮' 
AND SALARY > ANY (
                    SELECT SALARY 
                    FROM EMPLOYEE E
                    JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
                    WHERE JOB_NAME = '����'                         
                )
;

-- 4) ���� �����ӿ��� ���� ������ �ִ� �޿����� 
--    �� ���� �޴� �������� ���, �̸�, ���޸�, �޿� ��ȸ
SELECT 
    EMP_ID
    , EMP_NAME
    , JOB_NAME
    , SALARY
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE JOB_NAME = '����' 
AND SALARY > (
                SELECT MAX(SALARY)
                FROM EMPLOYEE E
                JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
                WHERE JOB_NAME = '����'                         
            )
;

/*
    <���߿� ���� ����>
        ��ȸ ��� ���� �� �������� ������ Į�� ���� ���� ���� ��
*/

SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = 
                            (
                                SELECT DEPT_CODE, JOB_CODE
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '������'
                            )
;

-- 2) �ڳ��� ����� ���� �ڵ尡 ��ġ�ϸ鼭 ���� 
--    ����� ������ �ִ� ����� ���, �̸�, ���� �ڵ�, ��� ���, ��ȸ
SELECT *
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) =
                            (
                                SELECT JOB_CODE, MANAGER_ID
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '�ڳ���'
                            )
;

/*
    <������ ���߿� ���� ����>
        ���� ������ ��ȸ ������� ���� ��, ���� ���� ���
*/

-- 1. �� ���޺��� �ּ� �޿��� �޴� ������� ���, �̸�, ���� �ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (
    SELECT JOB_CODE, MIN(SALARY)
    FROM EMPLOYEE
    GROUP BY JOB_CODE
)
;

/*
    <�ζ��� ��>
        FROM ���� ���� ������ �����ϰ�, ���� ������ ������ ����� ���̺� ��� ����Ѵ�.
*/

SELECT ABC.*, ROWNUM
FROM (
     SELECT ROWNUM NUM, EMP_NAME, SALARY
     FROM EMPLOYEE
     ORDER BY SALARY DESC
     ) ABC
WHERE NUM BETWEEN 11 AND 20
ORDER BY ROWNUM
;

