1. 급여가 10000이거나  14000인 사원들의 사번, 이름(first_name), 급여를 검색하시오.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary in(10000,14000);

2. first_name에 대소문자구별없이('e', 'E')를 포함하는 모든 사원을 검색하시오
SELECT first_name
FROM employees
WHERE LOWER(first_name) LIKE '%e%';

-- 3. first_name이 'J’로 시작하고 n문자를 포함하는 사원의 사번, 이름을 검색하시오.
예)
사번 	이름
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

4. 급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가 30번,60번, 90번인 부서는 제외하고 사원을 검색한다.

SELECT employee_id 사번, department_id 부서번호, first_name 이름, salary 급여, commission_pct 수당
FROM employees
WHERE  department_id NOT IN(30,60,90) AND salary>=10000;


5. 급여가 4000보다 많은 사원들의 부서별 급여평균를 출력하시오. 단 급여평균은 소숫점이하2자리에서 반올림합니다.
SELECT department_id, ROUND(AVG(salary),1)
FROM employees
WHERE salary>4000
GROUP BY department_id;

6.부서배치를 받지 않는 사원은 제외하고 부서별 급여평균을 출력하시오.단 급여평균은 소숫점이하2자리에서 반올림합니다.
SELECT department_id, ROUND(AVG(salary),1)
FROM employees
WHERE department_id IS not NULL
GROUP BY department_id;

7. 부서배치를 받지 않는 사원은 제외하고 급여평균이 10000이상인 부서별 급여평균을 출력하시오.단 급여평균은 소숫점이하2자리에서 반올림합니다.  
SELECT department_id, ROUND(AVG(salary),1)
FROM employees
WHERE department_id IS not NULL 
GROUP BY department_id
HAVING ROUND(AVG(salary),1) > 10000 ;


