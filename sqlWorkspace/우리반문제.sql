-- ���� �������� �̸��� ���̸� ���̰� ���� ������ ��ȸ
-- �̸��� ���� ����, ���̴� ������ ���
-- EX ���� 61��
--    �浿 54�� 

SELECT 
    REPLACE(EMP_NAME,(SUBSTR(EMP_NAME,2,1)),'*') AS �̸�
    , EXTRACT(YEAR FROM SYSDATE) - (19 || SUBSTR(EMP_NO,1,2)) - 1 || '��' AS ����
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) = 1
ORDER BY EMP_NO
;
-- �����
-- ���ʽ��� ���� �ʴ� ������� �������
-- �μ��� ��� �޿��� ��ȸ
-- (����޿��� 300���� �̻��� �μ��� ����)
-- (��ձ޿��� ���� ������� ����)

SELECT 
    DEPT_CODE
    , FLOOR(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE
WHERE BONUS IS NULL
GROUP BY DEPT_CODE
HAVING AVG(SALARY) < 3000000
ORDER BY AVG(SALARY) DESC
;

-- ������
-- ������ 3000���� ������ ������ ���,�̸�,���� ��ȸ
SELECT 
    EMP_ID
    , EMP_NAME
    , SALARY * 12 AS ����
FROM EMPLOYEE
WHERE SALARY * 12 <= 30000000
ORDER BY ���� DESC
;

-- �����δ�
-- D5�μ��� ��� �̸�, ����, ���� ���
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5')
ORDER BY SALARY
;
-- ������� ������ ���� ���� ����� ���� ���� ����� ���� ���� 
SELECT MAX(SALARY*12) - MIN(SALARY*12) AS ��������
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5')
ORDER BY SALARY
;

-- ���¿��
-- dept_code�� D5�� ������� �̸��� �޴��ȣ ���ڸ� 3�ڸ��� ����Ͻÿ�
SELECT EMP_NAME, SUBSTR(PHONE,1,3)
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5')
;

-- ��������
-- ���ʽ��� �޴� ����� ������� 
-- ���޺� ��� �޿� ��ȸ 
-- ��ձ޿��� ���� ������� ����
-- (��, �������� ���� ����� ��� ��ȸ)
SELECT 
    JOB_CODE
    , FLOOR(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEE
WHERE ENT_YN LIKE 'N'
GROUP BY JOB_CODE
ORDER BY AVG(SALARY) DESC
;

-- ���¿���
-- �μ��߿� �޿� �հ谡 ���� ���� �μ��� �޿��հ��?
-- (��, EMPLOYEE �������� Ǯ����Ѵ�.)
-- // �̰͵� �ϳ��� ����ϰ� �ؾ� �Ǵµ� �� �𸣰���
SELECT 
    SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE 
ORDER BY SUM(SALARY) DESC
;

-- �ڱپƴ�
-- ���ʽ��� �޴� ������� ��� �ڵ带 ��ȸ
-- ��� �޿��� 3000000�� �̻��� ����鸸
SELECT *
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
    AND SALARY >= 3000000;
    
-- ��������
-- �μ��� ������ ���� ������ ���������� �̸�, ���, ����, ��ȸ
SELECT 
    EMP_NAME
    , EMP_ID
    , SALARY
FROM EMPLOYEE
ORDER BY JOB_CODE ASC, SALARY
;

-- ��������
-- 010���� �������� �ʴ� ��ȭ��ȣ�� ���� ������� �̸�, �μ�, ��ȭ��ȣ 
-- (NULL ���� X, �μ� �ڵ�� ��������)
SELECT
    DEPT_CODE
    , PHONE
    , DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE PHONE NOT LIKE ('010%') AND DEPT_CODE IS NOT NULL
ORDER BY DEPT_CODE
;

-- ��������
-- �μ� ��� �޿��� 400���� �̻��� �μ��� ��ȸ(�Ҽ��� ���ý� �Ҽ��� ���ϴ� ������)
SELECT
    DEPT_CODE
    , AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 4000000
;

-- �������
-- ���ʽ��� �޴� ������� �������
-- �μ��� ��� ���ʽ� ��ȸ
SELECT 
    DEPT_CODE
    , (AVG(BONUS)) AS ��պ��ʽ�
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
;

-- �ۿ�����
-- ���� ����� �������
-- ���޺� ��ü �޿��� ��ȸ (��Ī : �޿��Ѿ�)
-- �����ڵ� J4 ����
-- �޿����� ���� ������� ����
SELECT 
    JOB_CODE
    ,SUM(SALARY) �޿��Ѿ�
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = 2
GROUP BY JOB_CODE
HAVING JOB_CODE != 'J4'
ORDER BY "�޿��Ѿ�" ASC;

-- ��������
-- �μ��ڵ庰 ������̵� ��ȣ�� ���� ��������� �μ��ڵ�� ������̵� ��ȸ
--(���ʽ��� �ִ� ����� ����)
SELECT 
    DEPT_CODE
    , MIN(EMP_ID)
FROM EMPLOYEE
WHERE BONUS IS NULL
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- ��������
-- ������ ����� �ִ� ����� �������
-- �μ��� �� �޿��� ��ȸ
-- (�޿� ���� ������� ����)
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY SUM(SALARY) DESC
;

-- ����
-- 1. �����ȣ 200���� ������ �̸���, �����ڵ� ���
SELECT EMP_NAME, JOB_CODE
FROM EMPLOYEE
WHERE EMP_ID = 200
;

-- 2. ȸ���� ������ �������� ���� '��'���� ����� ��� ���� �ڽŰ� ������ '��'���� �����Ű���� �Ѵ�. 
--    �����Ͽ��� �� ���̱� ���� ������ ���Ѻ���
SELECT REPLACE(EMP_NAME,'��%','��')
FROM EMPLOYEE
;

-- 3. �⻵�� �������� �̸��� ������ �������� ������ �ϳ��� ���̷��� �Ѵ�.
SELECT 
    REPLACE(EMP_NAME,'��%','��')
    , 'J' || (SUBSTR(JOB_CODE,2,1) - 1)
    , JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%'
;

-- �̼��δ�
-- �Ի�⵵�� ���� ������� ��ձ޿��� ���� 250�������� ���� ����鿡�� ������ ��Ű�� �Ѵ�
-- �̻������ �Ի�⵵�� ��� �޿��� ��ȸ�϶�
SELECT SUBSTR(HIRE_DATE,1,2), AVG(SALARY)
FROM EMPLOYEE
GROUP BY SUBSTR(HIRE_DATE,1,2)
HAVING AVG(SALARY) < 2500000
ORDER BY SUBSTR(HIRE_DATE,1,2) DESC
;

-- �̿�����
--����̸��� ���� ���� ���
SELECT 
    EMP_NAME
    , EXTRACT(YEAR FROM SYSDATE) - (19 || SUBSTR(EMP_NO,1,2)) - 1 || '��' AS ����
FROM EMPLOYEE
ORDER BY ���� DESC
;

--�μ��� �ְ�޿� ��ȸ
SELECT
    DEPT_CODE
    , MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;

-- ��������
-- ���س⵵�� 2017�⵵�̴� 
-- ������ 5�� �̸��̰� ������ �븮�� ������ ���, �̸�, ����, ���� ��ȸ
SELECT EMP_ID, EMP_NAME,  2017 - TO_CHAR(HIRE_DATE, 'RRRR') ����, JOB_CODE
FROM EMPLOYEE
WHERE TO_CHAR(HIRE_DATE, 'RRRR') > 2012 AND JOB_CODE ='J6';

-- ��������
-- ���޺� ��� �޿��� 200���� �̻��� �μ����� ��ȭ��ȣ 4��° �ڸ��� 3�� �����ڵ常 ��ȸ
-- �߰����� : (010-X1234-567) ���⼭ X�� 3�� ���
SELECT JOB_CODE
FROM EMPLOYEE
WHERE SUBSTR(PHONE, 5, 1) = '3'
GROUP BY JOB_CODE
HAVING AVG(SALARY) >= 2000000
;

-- �������
--70��� �̻��� ������� ������� �� �μ��� ��ձ޿��� �Ҽ��� �Ʒ��� �����ϰ� ���Ͻÿ�
--��, 70��� ���� ����� ����� 1���� �μ��� ����
--��� ����� �μ��ڵ�,�ο�,��ձ޿� 
SELECT DEPT_CODE �μ��ڵ�, COUNT(*)�ο�, FLOOR(AVG(SALARY)) ��ձ޿�
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,1,2) > '70'--70��� �̻��� ������� �������
GROUP BY DEPT_CODE
HAVING COUNT(*)>1
;


-- ��������
-- �������, ������� ��� �� ���ϱ�
SELECT SUBSTR(EMP_NO,8,1),COUNT(*)  
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- �ּ����
-- ȸ�� ä�� ������ �ý����� �����Ϸ��� �Ѵ�.
-- �׷��� ���ؼ��� �켱, �Ի������ϴ� ���մ븦 ���������� �ľ��ؾ��Ѵ�.
-- ������ ������ �Ի糪�̸� ���̰� ���� ������� ������. (2023�⵵������ �ѱ����̷� ���)
SELECT
    EMP_NAME �����
    , TO_NUMBER(TO_CHAR(HIRE_DATE, 'RRRR')) - TO_NUMBER('19' || SUBSTR(EMP_NO, 1, 2)) �Ի糪��
    , TO_NUMBER(TO_CHAR(SYSDATE, 'RRRR')) - TO_NUMBER('19' || SUBSTR(EMP_NO, 1, 2)) ���糪��
    , '19' || SUBSTR(EMP_NO, 1, 2) ����
    , TO_CHAR(HIRE_DATE, 'RRRR') �Ի�⵵
FROM EMPLOYEE
ORDER BY �Ի糪�� ASC
;


-- �ֿ켺��
-- �����ڰ� �ִ� �μ��ڵ� , �� ��� �̸� �� ������ ���Ͻÿ�
SELECT DEPT_CODE , EMP_NAME , SALARY * 12 ����
FROM EMPLOYEE
WHERE ENT_YN  = 'Y';

-- ���ʽ��� �޴� �μ��ڵ�, ��� �޿���  ��ȸ�Ͻÿ�(��ձ޿��� ���� �������)
SELECT 
    DEPT_CODE 
    , AVG(SALARY)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE
ORDER BY AVG(SALARY) DESC;

-- ����δ�
-- 10���� ������ ������� ��ȸ�ؼ�
-- �޿��� 50%��ŭ ���ʽ��� �ٷ����Ѵ�
-- �ش� ����ڵ�� ���� ���ʽ��� �ִ��� ��ȸ�Ͻÿ�

SELECT EMP_NAME �̸�
    ,EMP_NO ����
    ,SALARY �޿�
    ,SALARY * 0.5 AS ���ʽ�
    FROM EMPLOYEE
WHERE EMP_NO LIKE '__10%';

-- ȫ�ֿ���
-- �� ���޺��� ��� ����(�Ҽ������� �ݿø�)�� ���ʽ��� �޴� �ο��� ��ȸ
SELECT 
    JOB_CODE
    , ROUND(AVG(SALARY))
    , COUNT(BONUS)
FROM EMPLOYEE
GROUP BY JOB_CODE
;


