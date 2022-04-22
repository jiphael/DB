--SubQuery
-- ���������� ��ȯ�ϴ� ����� ���� 
-- ������ �Լ� 
-- ������ �Լ�

-- ���������� ��ġ�� ����
-- subquery : WHERE ��, HAVING��
-- inline view : FROM��
-- scalar subquery : SELECT��

-- �ִ�޿��� ����Ͻÿ�
SELECT MAX(salary)
FROM employees;

-- �ִ븦 �޿��� �޴� ����� ���, ����, �޿��� ����Ͻÿ�
-- 1) �ִ�޿��� ����Ѵ�
-- 2) 1)�� ���� �޿��� �޴� ����� �˻��Ѵ�
SELECT employee_id, first_name||' ' ||last_name ����
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 90�μ��� ������� ����Ͻÿ�
SELECT * FROM employees WHERE department_id = 90;
-- �����༭������
-----------
-- �ִ�޿��� �޴� ����� ���� �μ����� �ٹ��ϴ� ������� ����Ͻÿ�--2��
-- 0) �ִ�޿��� ����Ѵ�
-- 1)0)�� ���� �޿��� �޴»���� �μ���ȣ�� �˻��Ѵ�]
-- 2) 1)�� ���� �μ���ȣ�� ���� ����� �˻��Ѵ�
SELECT *
FROM employees
WHERE department_id =(SELECT department_id
                    FROM employees
                    WHERE salary = (SELECT MAX(salary)
                                   FROM employees)
                                   );
                                   
----------------------
--������ ��������
-- �μ��� ��ձ޿��� ����Ͻÿ�
SELECT department_id, TO_CHAR(ROUND(AVG(salary),1), '99,999.0') 
FROM employees 
GROUP BY department_id;

-- �μ��� ��ձ޿����� ���� �޿��� �޴� ������� ����Ͻÿ�
SELECT employee_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- �μ��� ��ձ޿����� ���� �޿��� �޴� ������� ����Ͻÿ� x 
1) �μ��� ��ձ޿�����Ѵ�
2) 1) ���� ���� �޿��� ���� ����� ���
SELECT department_id, employee_id, salary 
FROM employees
WHERE salary IN
(SELECT AVG(salary) FROM employees GROUP BY department_id) ; 


-- �μ��� �ּұ޿��� �޴� ������� ����Ͻÿ� x 
--1) �μ��� �ּұ޿��� �޴� ������� ����Ͻÿ�
--2) 1)�� ���� �޿��� �޴� ��� ���
SELECT department_id, employee_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                    FROM employees
            GROUP BY department_id);

--��å�� (job_title)�� 'President'�� ����� ���, �̸��� ����Ͻÿ�
SELECT employee_id, first_name 
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_title='President');

--��å�� (job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ�
SELECT employee_id, first_name 
FROM employees
WHERE job_id <> (SELECT job_id FROM jobs WHERE job_title='President');

SELECT employee_id, first_name 
FROM employees
WHERE job_id IN(SELECT job_id FROM jobs WHERE job_title <>'President');

-- ���� 'Davies'�� ����� ���� �μ��� �ٹ��ϴ� ������� ���, ��, �̸��� ����Ͻÿ�-
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN(SELECT department_id FROM employees WHERE last_name = 'Davies');

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name <>'Davies' AND department_id IN(SELECT department_id FROM employees WHERE last_name = 'Davies');

-- 'Sales'�μ��� ��ձ޿����� ���� �޿��� �޴� 'Salaes'�μ��� ������� ����Ͻÿ�
-- 1-1) 'Sales'�μ����� �μ���ȣ�� �˻��Ѵ�
-- 1-2) 'Sales'�μ����� ��ձ޿�����Ѵ�.
-- 2) 1-1)�� ���� �μ�����̰� 1-2) ���� ū �޿��� �޴� ����� ����Ѵ�
SELECT department_id, employee_id, salary
FROM employees
WHERE department_id = (SELECT department_id 
                        FROM departments 
                        WHERE department_name='Sales')
                        
AND salary > (SELECT AVG(salary) FROM employees
                    WHERE department_id = 
                    (SELECT department_id 
                        FROM departments 
                        WHERE department_name='Sales'));

--��ȣ�������������� �ذ��Ѵ�.
           
SELECT department_id, employee_id, salary
FROM employees maine
WHERE department_id = (SELECT department_id 
                        FROM departments 
                        WHERE department_name='Sales')
                        
AND salary > (SELECT AVG(salary) FROM employees
                    WHERE department_id = 
                        maine.department_id);
                        
-- ����� 1���̶� �ִ� �μ��� ����Ͻÿ�
SELECT *
FROM departments d
WHERE EXISTS (SELECT * 
             FROM employees 
             WHERE department_id = d.department_id); //exist �� ��ȣ���� ���������� �����. �������������� ��������.
             
-- ����� 1�� ���� �μ��� ����Ͻÿ�
SELECT *
FROM departments d
WHERE NOT EXISTS (SELECT * 
             FROM employees 
             WHERE department_id = d.department_id); //exist �� ��ȣ���� ���������� �����. �������������� ��������.
             
             
             
------------------------------------------------
-- INLINE VIEW

--rownum : ���ȣ�� �˷��ִ� �ǻ��÷� 
SELECT rownum, employee_id, salary
FROM employees
WHERE salary > 10000;

--ó������
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
SELECT rownum, employee_id, salary
FROM employees
WHERE salary > 10000
ORDER BY salary DESC; -- rownum �߱޽����� SELECT ����.

-- �޿��� 10000���� ���� ������� ����Ͻÿ�.
-- �� ���ȣ�� ���� ����Ѵ� // �޿��� ���������� �������.
SELECT rownum, a.*
FROM (SELECT employee_id, salary
      FROM employees
      WHERE salary > 10000
      ORDER BY salary DESC) a;

-- �޿��� 10000���� ���� ������� ����Ͻÿ�.
-- �� ���ȣ�� ��������Ѵ�
-- 1��~5������� ����Ѵ�
SELECT rownum, a.*
FROM (SELECT employee_id, salary
      FROM employees
      WHERE salary > 10000
      ORDER BY salary DESC) a
--WHERE rownum <6;
WHERE rownum BETWEEN 1 AND 5;

-- �޿��� 10000���� ���� ������� ����Ͻÿ�.
-- �� ���ȣ�� ��������Ѵ�
-- 6��~10������� ����Ѵ�
SELECT *
FROM
(SELECT rownum rn, a.*
  FROM (SELECT employee_id, salary
      FROM employees
      WHERE salary > 10000
      ORDER BY salary DESC) a
      ) b     
WHERE rn BETWEEN 6 AND 10;
-------------

-- sclar subquery : SELECT���� �ۼ��ϴ� subquery�� scalry query.
-- 'Seattle', 'Toronto'���ÿ�  �ٹ��ϴ� 
-- ������� ���ø�,���, �̸�, �μ�ID, �μ��� �� ����Ͻÿ�
SELECT city, employee_id, first_name, d.department_id, d.department_name 
FROM employees e JOIN departments d ON(e.department_id = d.department_id)
                 JOIN locations l ON(d.location_id = l.location_id)
WHERE l.city IN ('Seattle', 'Toronto');

-- ������� ���, �̸�, �μ�ID, �μ��� �� ����Ͻÿ�
SELECT employee_id, first_name, department_id
    ,(SELECT department_name FROM departments d
      WHERE d.department_id = e.department_id)
FROM employees e;

--------------------
--- ������� ���, �̸�, �μ�ID, �μ���, ���ø��� ����Ͻÿ� (scalar
SELECT employee_id, first_name, department_id
    ,(SELECT department_name FROM departments d
      WHERE d.department_id = e.department_id)
    , (SELECT city
      FROM locations
      WHERE location_id = (SELECT location_id
                           FROM departments
                           WHERE department_id = e. department_id)
     AND city IN ('Seattle', 'Toronto')
      )                     
FROM employees e;

-- 'Seattle', 'Toronto'���ÿ�  �ٹ��ϴ� 
-- ������� ���ø�,���, �̸�, �μ�ID, �μ��� �� ����Ͻÿ� -- Scalar �����δ� x,  join���� �غ���.
SELECT employee_id, first_name, department_id
      ,(SELECT department_name FROM departments d
        WHERE d.department_id = e.department_id)
      ,(SELECT city
        FROM locations
        WHERE location_id =(SELECT location_id 
                            FROM departments
                            WHERE department_id = e.department_id)
        )        
FROM employees e
WHERE department_id IN (SELECT department_id
                       FROM departments
                       WHERE location_id IN (SELECT location_id
                                             FROM locations
                                             WHERE city IN('Seattle', 'Toronto')
                                             )
                       )
;