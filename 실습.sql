제출 : ohmoonjeong1@gmail.com
제목 : 각자이름-DB실습2
내용 : 문제와 답 붙여넣기

1. 직책(job_title)이 'President'인 사원의 사번, 이름을 출력하시오: (NaturalJOIN으로 표현)
SELECT employee_id, first_name
FROM employees NATURAL JOIN jobs
WHERE job_title in('President');


2. 직책(job_title)이 'President'가 아닌 사원의 사번, 이름을 출력하시오(USING으로 표현)
SELECT employee_id, first_name
FROM employees JOIN jobs USING(job_id)
WHERE job_title not in('President');


3. 부서번호, 부서명, 부서별 급여총액과 평균급여를 출력하시오.
단, 급여총액이 낮은 순으로 정렬하고, 
평균급여는 소수점 이하 1 자리까지 나타나도록 반올림해야 한다.
SELECT e.department_id, department_name, ROUND(AVG(salary),1), SUM(salary)
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name
ORDER BY SUM(salary);

4. 'Seattle', 'Toronto'도시에  근무하는 
사원들의 도시명,사번, 이름, 부서ID, 부서명 을 출력하시오
SELECT city,employee_id, first_name,d.department_id,department_name
FROM employees e 
JOIN departments d ON(e.department_id = d.department_id)
JOIN locations l ON(d.location_id = l.location_id)
WHERE city in('Seattle', 'Toronto');

5. 'Seattle'을 제외한 도시의 부서별 사원수가 5명미만인 
도시명, 부서ID, 부서명, 사원수를 출력하시오 
SELECT city, d.department_id, d.department_name, count(e.employee_id)
FROM departments d
JOIN employees e  ON(e.department_id = d.department_id)
JOIN locations l ON(d.location_id = l.location_id)
WHERE city not in('Seattle')
GROUP BY  city, d.department_id,  d.department_name
HAVING count(e.employee_id) <5;


6. 부서ID가 50 이거나 80인 부서에 근무하는 사원들의 직무ID와 직책(job_title)을 출력하시오.
결과에서 직종(job_id)의 중복은 제거하시오 --5건
SELECT job_title, department_id
FROM employees NATURAL JOIN jobs
WHERE department_id in(50,80)
GROUP BY job_id, department_id, job_title;


7. 사원의 사번, 관리자번호, 부서ID, 부서명, 부서장ID를 출력하시오
SELECT e.employee_id, e.manager_id,d2.department_id, d2.department_name,m.employee_id
FROM employees e JOIN employees m ON(e.manager_id = m.employee_id)
JOIN departments d ON(e.department_id = d.department_id)
JOIN departments d2 ON(d.department_id = d2.department_id);

8. 사원의 사번, 관리자번호, 부서ID, 부서명, 부서장ID를 출력하시오. 단, 부서없는 사원도, 사원이 없는 부서도 출력한다
SELECT e.employee_id, e.manager_id, d.department_id, d.department_name, d.manager_id
FROM employees e FULL JOIN departments d ON( e.department_id = d.department_id);

9. 성이 'Davies'인 사원의 부서ID와 급여를 출력하시오.
SELECT d.department_id,salary
FROM employees e 
JOIN departments d ON(e.department_id = d.department_id)
WHERE last_name in ('Davies');

10. 성이 'Davies'인 사원과 같은 부서에 근무하는 사원들의 사번, 성, 이름을 출력하시오--44건
SELECT d.employee_id, d.first_name, d.last_name
FROM employees e 
JOIN employees d ON(e.department_id = d.department_id)
WHERE e.last_name in ('Davies') AND d.last_name NOT IN('Davies');

