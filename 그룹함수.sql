-- 그룹함수 COUNT(), SUM(), MIN(), MAX(), AVG()
SELECT COUNT(*), COUNT(commission_pct)
              , SUM(salary)
              , AVG(salary)
              , MIN(salary), MIN(hire_date)
              , MAX(salary), MAX(hire_date)
              , STDDEV(salary)
FROM employees;

-- 입사년도가 2008년인 사원수와 평균급여, 사원들이 속한 부서수를 출력하시오
-- 평균급여는 소수점이하 1자리까지 표시하고 2자리에서 반올림한다
SElECT COUNT(*) 사원수,  ROUND(AVG(salary),1) 평균급여, COUNT(DISTINCT department_id) 부서수
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2007';
-- WHERE SUBSRTR(hire_date, 1,2) = '08';

SElECT * FROM employees WHERE department_id IS NULL;
---------------------------------------------------------------

-- 그룹화


-- 지역별 지역번호(location_id), 부서수를 출력하시오
SELECT location_id, count(department_id)
FROM departments
-- WHERE
GROUP BY location_id;
-- HAVING
-- ORDER BY

-- 지역별 지역번호(location_id), 부서수를 출력하시오
-- 부서수가 10개 이상인 지역만 출력한다.
SELECT location_id, count(department_id)
FROM departments
GROUP BY location_id
HAVING Count(department_id) >=10;

-- 지역별 지역번호(location_id), 부서수를 출력하시오
-- 지역번호가 2000번 이상인 지역만 출력한다.
SELECT location_id, count(department_id)
FROM departments
WHERE location_id >= 2000
GROUP BY location_id;
--HAVING location_id >= 2000;

-- 지역별 지역번호, 부서수, 부서명을 출력하시오 그룹바이로 해결못함.부서명을 넣을경우 부서수가 원하는값이 아닌 1로나옴.
SELECT location_id, count(department_id), department_name 부서명
FROM departments
GROUP BY location_id, department_name;

-- 년도별 입사자수를 출력하시오, 단 최근년도부터 출력한다.
SELECT TO_CHAR(hire_date, 'YYYY') 입사년도, count(*) 입사자수
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 입사년도 DESC;

-- 하반기(7월 ~ 12월) 월별 입사자수를 출력하시오
-- 입사자수가 5명이상인 경우만 출력한다

SELECT TO_CHAR(hire_date, 'MM') 입사월, count(*) 입사자수
FROM employees
WHERE TO_CHAR(hire_date,'MM')> '06'
GROUP BY TO_CHAR(hire_date, 'MM')
HAVING count(*)>=5;

--- 부서별 부서번호와 최대급여를 출력하시오
SELECT department_id, MAX(salary), MIN(salary), TRUNC(AVG(salary),1), TRUNC(STDDEV(salary),1)
FROM employees
GROUP BY department_id;

-- 부서별 부서번호와 최대급여, 최대급여자 사번을 출력하시오 x -> sypquery 로 해결
SELECT department_id, MAX(salary) -- employee_id
FROM employees
GROUP BY department_id;


----------


-----

