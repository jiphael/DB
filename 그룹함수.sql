-- �׷��Լ� COUNT(), SUM(), MIN(), MAX(), AVG()
SELECT COUNT(*), COUNT(commission_pct)
              , SUM(salary)
              , AVG(salary)
              , MIN(salary), MIN(hire_date)
              , MAX(salary), MAX(hire_date)
              , STDDEV(salary)
FROM employees;

-- �Ի�⵵�� 2008���� ������� ��ձ޿�, ������� ���� �μ����� ����Ͻÿ�
-- ��ձ޿��� �Ҽ������� 1�ڸ����� ǥ���ϰ� 2�ڸ����� �ݿø��Ѵ�
SElECT COUNT(*) �����,  ROUND(AVG(salary),1) ��ձ޿�, COUNT(DISTINCT department_id) �μ���
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2007';
-- WHERE SUBSRTR(hire_date, 1,2) = '08';

SElECT * FROM employees WHERE department_id IS NULL;
---------------------------------------------------------------

-- �׷�ȭ


-- ������ ������ȣ(location_id), �μ����� ����Ͻÿ�
SELECT location_id, count(department_id)
FROM departments
-- WHERE
GROUP BY location_id;
-- HAVING
-- ORDER BY

-- ������ ������ȣ(location_id), �μ����� ����Ͻÿ�
-- �μ����� 10�� �̻��� ������ ����Ѵ�.
SELECT location_id, count(department_id)
FROM departments
GROUP BY location_id
HAVING Count(department_id) >=10;

-- ������ ������ȣ(location_id), �μ����� ����Ͻÿ�
-- ������ȣ�� 2000�� �̻��� ������ ����Ѵ�.
SELECT location_id, count(department_id)
FROM departments
WHERE location_id >= 2000
GROUP BY location_id;
--HAVING location_id >= 2000;

-- ������ ������ȣ, �μ���, �μ����� ����Ͻÿ� �׷���̷� �ذ����.�μ����� ������� �μ����� ���ϴ°��� �ƴ� 1�γ���.
SELECT location_id, count(department_id), department_name �μ���
FROM departments
GROUP BY location_id, department_name;

-- �⵵�� �Ի��ڼ��� ����Ͻÿ�, �� �ֱٳ⵵���� ����Ѵ�.
SELECT TO_CHAR(hire_date, 'YYYY') �Ի�⵵, count(*) �Ի��ڼ�
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY �Ի�⵵ DESC;

-- �Ϲݱ�(7�� ~ 12��) ���� �Ի��ڼ��� ����Ͻÿ�
-- �Ի��ڼ��� 5���̻��� ��츸 ����Ѵ�

SELECT TO_CHAR(hire_date, 'MM') �Ի��, count(*) �Ի��ڼ�
FROM employees
WHERE TO_CHAR(hire_date,'MM')> '06'
GROUP BY TO_CHAR(hire_date, 'MM')
HAVING count(*)>=5;

--- �μ��� �μ���ȣ�� �ִ�޿��� ����Ͻÿ�
SELECT department_id, MAX(salary), MIN(salary), TRUNC(AVG(salary),1), TRUNC(STDDEV(salary),1)
FROM employees
GROUP BY department_id;

-- �μ��� �μ���ȣ�� �ִ�޿�, �ִ�޿��� ����� ����Ͻÿ� x -> sypquery �� �ذ�
SELECT department_id, MAX(salary) -- employee_id
FROM employees
GROUP BY department_id;


----------


-----

