���� : ohmoonjeong1@gmail.com
���� : �����̸�-DB�ǽ�2
���� : ������ �� �ٿ��ֱ�

1. ��å(job_title)�� 'President'�� ����� ���, �̸��� ����Ͻÿ�: (NaturalJOIN���� ǥ��)
SELECT employee_id, first_name
FROM employees NATURAL JOIN jobs
WHERE job_title in('President');


2. ��å(job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ�(USING���� ǥ��)
SELECT employee_id, first_name
FROM employees JOIN jobs USING(job_id)
WHERE job_title not in('President');


3. �μ���ȣ, �μ���, �μ��� �޿��Ѿװ� ��ձ޿��� ����Ͻÿ�.
��, �޿��Ѿ��� ���� ������ �����ϰ�, 
��ձ޿��� �Ҽ��� ���� 1 �ڸ����� ��Ÿ������ �ݿø��ؾ� �Ѵ�.
SELECT e.department_id, department_name, ROUND(AVG(salary),1), SUM(salary)
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name
ORDER BY SUM(salary);

4. 'Seattle', 'Toronto'���ÿ�  �ٹ��ϴ� 
������� ���ø�,���, �̸�, �μ�ID, �μ��� �� ����Ͻÿ�
SELECT city,employee_id, first_name,d.department_id,department_name
FROM employees e 
JOIN departments d ON(e.department_id = d.department_id)
JOIN locations l ON(d.location_id = l.location_id)
WHERE city in('Seattle', 'Toronto');

5. 'Seattle'�� ������ ������ �μ��� ������� 5��̸��� 
���ø�, �μ�ID, �μ���, ������� ����Ͻÿ� 
SELECT city, d.department_id, d.department_name, count(e.employee_id)
FROM departments d
JOIN employees e  ON(e.department_id = d.department_id)
JOIN locations l ON(d.location_id = l.location_id)
WHERE city not in('Seattle')
GROUP BY  city, d.department_id,  d.department_name
HAVING count(e.employee_id) <5;


6. �μ�ID�� 50 �̰ų� 80�� �μ��� �ٹ��ϴ� ������� ����ID�� ��å(job_title)�� ����Ͻÿ�.
������� ����(job_id)�� �ߺ��� �����Ͻÿ� --5��
SELECT job_title, department_id
FROM employees NATURAL JOIN jobs
WHERE department_id in(50,80)
GROUP BY job_id, department_id, job_title;


7. ����� ���, �����ڹ�ȣ, �μ�ID, �μ���, �μ���ID�� ����Ͻÿ�
SELECT e.employee_id, e.manager_id,d2.department_id, d2.department_name,m.employee_id
FROM employees e JOIN employees m ON(e.manager_id = m.employee_id)
JOIN departments d ON(e.department_id = d.department_id)
JOIN departments d2 ON(d.department_id = d2.department_id);

8. ����� ���, �����ڹ�ȣ, �μ�ID, �μ���, �μ���ID�� ����Ͻÿ�. ��, �μ����� �����, ����� ���� �μ��� ����Ѵ�
SELECT e.employee_id, e.manager_id, d.department_id, d.department_name, d.manager_id
FROM employees e FULL JOIN departments d ON( e.department_id = d.department_id);

9. ���� 'Davies'�� ����� �μ�ID�� �޿��� ����Ͻÿ�.
SELECT d.department_id,salary
FROM employees e 
JOIN departments d ON(e.department_id = d.department_id)
WHERE last_name in ('Davies');

10. ���� 'Davies'�� ����� ���� �μ��� �ٹ��ϴ� ������� ���, ��, �̸��� ����Ͻÿ�--44��
SELECT d.employee_id, d.first_name, d.last_name
FROM employees e 
JOIN employees d ON(e.department_id = d.department_id)
WHERE e.last_name in ('Davies') AND d.last_name NOT IN('Davies');

