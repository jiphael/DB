1. �޿��� 10000�̰ų�  14000�� ������� ���, �̸�(first_name), �޿��� �˻��Ͻÿ�.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary in(10000,14000);

2. first_name�� ��ҹ��ڱ�������('e', 'E')�� �����ϴ� ��� ����� �˻��Ͻÿ�
SELECT first_name
FROM employees
WHERE LOWER(first_name) LIKE '%e%';

-- 3. first_name�� 'J���� �����ϰ� n���ڸ� �����ϴ� ����� ���, �̸��� �˻��Ͻÿ�.
��)
��� 	�̸�
---------------------
110 John
139 John
145 John
181 Jean
189 Jennifer
200 Jennifer
---------------------

SELECT first_name
FROM employees
WHERE first_name LIKE 'J%n%' ;

4. �޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ�� 30��,60��, 90���� �μ��� �����ϰ� ����� �˻��Ѵ�.

SELECT employee_id ���, department_id �μ���ȣ, first_name �̸�, salary �޿�, commission_pct ����
FROM employees
WHERE  department_id NOT IN(30,60,90) AND salary>=10000;


5. �޿��� 4000���� ���� ������� �μ��� �޿���ո� ����Ͻÿ�. �� �޿������ �Ҽ�������2�ڸ����� �ݿø��մϴ�.
SELECT department_id, ROUND(AVG(salary),1)
FROM employees
WHERE salary>4000
GROUP BY department_id;

6.�μ���ġ�� ���� �ʴ� ����� �����ϰ� �μ��� �޿������ ����Ͻÿ�.�� �޿������ �Ҽ�������2�ڸ����� �ݿø��մϴ�.
SELECT department_id, ROUND(AVG(salary),1)
FROM employees
WHERE department_id IS not NULL
GROUP BY department_id;

7. �μ���ġ�� ���� �ʴ� ����� �����ϰ� �޿������ 10000�̻��� �μ��� �޿������ ����Ͻÿ�.�� �޿������ �Ҽ�������2�ڸ����� �ݿø��մϴ�.  
SELECT department_id, ROUND(AVG(salary),1)
FROM employees
WHERE department_id IS not NULL 
GROUP BY department_id
HAVING ROUND(AVG(salary),1) > 10000 ;


