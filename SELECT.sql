SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees;

SELECT employee_id, first_name, last_name, salary
FROM employees;

SELECT employee_id ���, first_name, last_name, salary
FROM employees;

SELECT employee_id ���, first_name ||' '|| last_name ����, salary �޿�,
12*(salary + salary*NVL(commission_pct, 0)) "���� ����"
FROM employees;

Select DISTINCT department_id, job_id
FROM employees;

������
- ��������� : +, -, *, /
- �񱳿����� : >, >=, <. <=. = ,<>
- �������� : AND, OR,NOT
- BETWEEN
-IN ������
-LIKE ������

selectó������
from > where > group by > having > select > order by

SELECT����
SELECT
FROM
[ �������ɺκ�
WHERE
GROUP BY
HAVING
ORDER BY
]

-- �μ���ȣ�� 90��
-- ������� ���, ����, �޿�, �μ���ȣ�� ����Ͻÿ�.

SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
WHERE department_id <> 90;

-- 90�� �μ��� �ٹ��ϸ鼭�� �޿��� 20000 �̸��� �������
-- ����Ͻÿ�

SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
WHERE department_id = 90 AND salary < 20000

--�޿��� 10000�̻��̰� 20000������ ������� ����Ͻÿ�.
SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
--WHERE  salary >= 10000 AND salary <= 20000; 
WHERE salary BETWEEN 10000 AND 20000;

-- �μ��� 10���μ��̰ų� 90���μ��� ������� ����Ͻÿ�
-- or ������ �Ǵ� in ������.
SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
-- WHERE department_id =10 or department_id=90
WHERE department_id IN(10,90);

--�޿��� 10000�̸��̰ų� 20000�ʰ��� ������� ����Ͻÿ�.
SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
--WHERE salary <10000 OR salary >20000;
WHERE NOT (salary BETWEEN 10000 AND 20000);


-- �μ��� 10���μ�, 90���μ��� �ƴ� �μ��� ������� ����Ͻÿ�
-- or ������ �Ǵ� in ������.
SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
--WHERE  department_id <>10 and department_id<>90
 WHERE  department_id NOT IN(10,90);

-- �μ���ȣ�� 10, 90�� �μ��̰� 
-- �޿��� 1000�̻� 20000������ ������� ����Ͻÿ�.
SELECT employee_id ���, first_name||' '||last_name ����, salary �޿�, department_id �μ���ȣ
FROM employees
--WHERE  department_id <>10 and department_id<>90
 WHERE  department_id IN(10,90) AND salary BETWEEN 1000 AND 20000;
 --WHERE (department_id = 10 OR department_id =90) 
-- AND salary>=1000 AND salary <=20000;

SELECT * FROM departments;
--�μ��̸��� IT�� ���Ե� �μ���������Ͻÿ�.
SELECT *
FROM departments
WHERE department_name LIKE '%IT%';

-- ������(job_title)�� 'Manager'�� ������ ��������� ����Ͻÿ�
SELECT *
FROM jobs
WHERE job_title LIKE '%Manager';

-- ����̸�(first_name)�� �ι�° ����° ���ڰ� 'an'�� ������� ����Ͻÿ�.
SELECT * FROM EMPLOYEES
WHERE first_name LIKE '_an%';

-- ����(commission_pct)�� ���� �ʴ� ������� ����Ͻÿ�.
SELECT *
FROM employees
WHERE commission_pct IS NULL;
--null���� is�� ��.

-- ���� �޿��� �޴� ��������� ������� ����Ͻÿ�
SELECT *
FROM employees
order by salary DESC;

-- ���� �޿��� ���� ��������� ������� ����Ͻÿ�. �� �޿��� ������ �μ��� ���������� �����Ͻÿ�.
SELECT *
FROM employees
order by salary DESC, department_id;

-- �Ǳ޿�(�޿� + �޿� * �����) �� ���������� ������� ���, ����, �μ���ȣ, �޿�, �Ǳ޿��� ����Ͻÿ�.
SELECT employee_id ���, first_name ||' ' || last_name ����, department_id �μ���ȣ, salary �޿�, salary + (salary*NVL(commission_pct, 0))
�Ǳ޿�
FROM employees
--ORDER BY �Ǳ޿�;
--ORDER BY salary + (salary*NVL(commission_pct, 0));
ORDER BY 5;

-- ���ټ��ں��� ������� ����Ͻÿ�
SELECT *
FROM employees
ORDER BY hire_date;

-- �μ���ȣ�� 10, 50, 80�μ��� ������� ����Ͻÿ�
-- ��  �޿��� ���� ������� ����Ͻÿ�
SELECT * 
FROM employees
WHERE department_id IN(10,50,80)
ORDER BY salary DESC;

-- �μ���ȣ�� 10, 50, 80�μ��� ������� ���, �̸��� ����Ͻÿ�
-- ��  �޿��� ���� ������� ����Ͻÿ�
SELECT employee_id ���, first_name ||' ' || last_name ����
FROM employees
WHERE department_id IN(10,50,80)
ORDER BY salary DESC;






