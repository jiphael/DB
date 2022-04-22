-- ����� ���, ����������ȣ, ����������ȣ�� ����Ͻÿ�
-- ��, ���������� ���� ����� ����Ѵ�
-- ���, ����������ȣ, ����������ȣ
SELECT e.employee_id, e.job_id "����������ȣ", jh.job_id "����������ȣ"
FROM employees e 
     LEFT JOIN job_history jh ON (e.employee_id = jh.employee_id)
ORDER BY e.employee_id, jh.job_id;

-------------
-- ������ : UNION ALL :�ߺ������� x ,�ڵ�����x
--         UNION : �ߺ��Ȱ�����, �ڵ�����, ù��°�÷����� �������������̵�.
SELECT employee_id "���", job_id "����1"
FROM employees
UNION
SELECT  employee_id, job_id "����2"
FROM job_history;

--UNION ALL :�ߺ����� --117��, �ڵ�����x
SELECT employee_id "���", job_id "����1"
FROM employees
UNION ALL
SELECT  employee_id, job_id "����2"
FROM job_history
ORDER BY "���";

-- ���������� ���� ���� ������ ����ϴ� ������� ���, ������ȣ�� ����Ͻÿ�
SELECT employee_id "���", job_id "����1"
FROM employees
INTERSECT
SELECT  employee_id, job_id "����2"
FROM job_history
ORDER BY "���";

SELECT e.employee_id, e.job_id "����"
FROM employees e 
     JOIN job_history jh ON (e.employee_id = jh.employee_id)
WHERE jh.job_id =  e.job_id
ORDER BY e.employee_id ;

-- ��������� �ٸ� ���������� ����ߴ� ������� ���, ���������� ����Ͻÿ�.
SELECT  employee_id "���", job_id "��������"
FROM job_history
MINUS
SELECT employee_id , job_id "�������"
FROM employees
ORDER BY "���";

-- ��������� �ٸ� ���������� ����ߴ� ������� ���, ��������� ����Ͻÿ�.
SELECT  employee_id "���", job_id "�������"
FROM employees
MINUS
SELECT employee_id , job_id "��������"
FROM job_history
ORDER BY "���";

-- ������������� �ִ� ����� ����� ����Ͻÿ�
SELECT employee_id
FROM job_history;

-- ������������� �ִ� ����� ����� ����Ͻÿ�
-- �ߺ����� �ʴ´�
SELECT UNIQUE employee_id
FROM job_history;

SELECT DISTINCT employee_id
FROM job_history;

-- ������������� ���� ����� ����� ����Ͻÿ�
SELECT employee_id
FROM employees
MINUS
SELECT employee_id
FROM job_history
ORDER BY employee_id;
