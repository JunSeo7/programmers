/*
    <GROUP BY>
        �׷� ������ ������ �� �ִ� ����
        ���� ���� ������ �ϳ��� �׷����� ��� ó���� �������� ����Ѵ�.
*/

-- ��ü �޿� ���� ��ȸ
SELECT SUM(SALARY)
FROM EMPLOYEE
;

-- �� �μ��� �޿� ���� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- ��ü ��� �� ��ȸ
SELECT COUNT(EMP_NAME)
FROM EMPLOYEE;

-- �� �μ��� ��� �� ��ȸ
SELECT DEPT_CODE, COUNT(EMP_NAME)
FROM EMPLOYEE
GROUP BY DEPT_CODE
;

-- �� �μ��� ���ʽ��� �޴� �����
SELECT DEPT_CODE, COUNT(BONUS)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL AND DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE
;

-- �� ���޺� �޿� ��� ��ȸ
SELECT JOB_CODE, TRUNC(AVG(SALARY),1)
FROM EMPLOYEE
GROUP BY JOB_CODE
;

-- �μ��� �����, ���ʽ��� �޴� �����, �޿��� ��, ��� �޿�, �ְ� �޿�, ���� �޿� ��ȸ
SELECT 
    DEPT_CODE "�μ� �ڵ�"
    , COUNT(*) "�μ��� �����"
    , COUNT(BONUS) "���ʽ��� �޴� ��� ��"
    , SUM(SALARY) "�޿��� ��"
    , FLOOR(AVG(SALARY)) "��� �޿�"
    , MAX(SALARY) "�ְ� �޿�"
    , MIN(SALARY) "���� �޿�"
FROM EMPLOYEE 
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- ���� �� ����� ��ȸ
SELECT SUBSTR(EMP_NO, 8, 1) AS "���� �ڵ�",
       COUNT(*) AS "�����"
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1)
ORDER BY "���� �ڵ�"
;

/*
    <HAVING>
        �׷쿡 ���� ������ ������ �� ����ϴ� ����(�ַ� �׷� �Լ��� ����� ������ �� ����)
    
    * ���� ����
        5: SELECT      ��ȸ�ϰ��� �ϴ� Į���� AS "��Ī" | ���� | �Լ���
        1: FROM        ��ȸ�ϰ��� �ϴ� ���̺��
        2: WHERE       ���ǽ�
        3: GROUP BY    �׷� ���ؿ� �ش��ϴ� Į���� | ���� | �Լ���
        4: HAVING      �׷쿡 ���� ���ǽ�
        6: ORDER BY    ���� ���ؿ� �ش��ϴ� Į���� | ��Ī | Į�� ����
*/

-- �� �μ��� ��� �޿� ��ȸ
SELECT 
    DEPT_CODE
    , FLOOR(AVG(SALARY)) || '��'
FROM EMPLOYEE
GROUP BY DEPT_CODE
;

-- �� �μ��� ��� �޿� ��ȸ
SELECT 
    DEPT_CODE
    ,FLOOR(AVG(SALARY)) || '��' "��� �޿�"
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000
;

-- ���� �� �� �޿��� ���� õ���� �̻��� ���޵鸸 ��ȸ
SELECT 
    JOB_CODE
    ,SUM(SALARY) || '��' "�� �޿�"
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY) >= 10000000
;

-- �μ��� ���ʽ��� �޴� ����� ���� �μ��鸸 ��ȸ
SELECT 
    DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) LIKE 0
;

-- ���ʽ��� ���� �ʴ� ������� �������
-- �μ��� ��� �޿��� ��ȸ
-- (����޿��� 300���� �̻��� �μ��� ����)
-- (��ձ޿��� ���� ������� ����)

SELECT 
    DEPT_CODE
    , FLOOR(AVG(SALARY)) "��� �޿�"
FROM EMPLOYEE
WHERE BONUS IS NULL
GROUP BY DEPT_CODE 
HAVING AVG(SALARY) < 3000000
ORDER BY "��� �޿�" DESC
;


/*
    <���� �Լ�>
        �׷캰 ������ ��� ���� �߰� ���踦 ��� ���ִ� �Լ�
*/

-- ���޺� �޿��� �հ踦 ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- ������ �࿡ ��ü �� �޿��� �հ���� ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY JOB_CODE;

SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE)
ORDER BY JOB_CODE;

-- �μ� �ڵ嵵 ���� ���� �ڵ嵵 ���� ������� �׷� ��� �޿��� �հ踦 ��ȸ
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE, JOB_CODE;

-- ROLLUP(�÷� 1, �÷� 2, ...) -> �÷� 1�� ������ �߰����踦 ���� �Լ�
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;

-- CUBE(�÷� 1, �÷� 2, ...) -> �÷� 1�� ������ �߰����踦 ����, �÷� 2�� ������ �߰����踦 ����. ��, ���޵Ǵ� �÷� ��� �����ϴ� �Լ�
SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY DEPT_CODE, JOB_CODE;



/*
    <���� ������>
        ���� ���� �������� ������ �ϳ��� ���������� ����� �������̴�.
        
        UNION       : �� �������� ������ ������� ���� �� �ߺ��Ǵ� ���� �����Ѵ�. (������)
        UNION ALL   : UNION�� �����ϰ� �� �������� ������ ������� ���ϰ� �ߺ��� ����Ѵ�. (������)
        INTERSECT   : �� �������� ������ ������� �ߺ��� ������� �����Ѵ�. (������)
        MINUS       : ���� ������ ��������� ���� ������ ������� �� ������ ������� �����Ѵ�. (������)
*/

-- 1. �μ��ڵ�
SELECT EMP_ID,EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
;

-- 2. �޿� 300 �ʰ�
SELECT EMP_ID,EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;

-- 1�� + 2�� 
-- 1. �μ��ڵ�
SELECT 
    EMP_ID
    , EMP_NAME
    , DEPT_CODE
    , SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT 
    EMP_ID
    , EMP_NAME
    , DEPT_CODE
    , SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
;












