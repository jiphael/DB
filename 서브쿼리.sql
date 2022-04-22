--SubQuery
-- 서브쿼리가 반환하는 행수에 따라 
-- 단일행 함수 
-- 여러행 함수

-- 서브쿼리의 위치에 따라
-- subquery : WHERE 절, HAVING절
-- inline view : FROM절
-- scalar subquery : SELECT절

-- 최대급여를 출력하시오
SELECT MAX(salary)
FROM employees;

-- 최대를 급여를 받는 사원의 사번, 성명, 급여를 출력하시오
-- 1) 최대급여를 계산한다
-- 2) 1)과 같은 급여를 받는 사원을 검색한다
SELECT employee_id, first_name||' ' ||last_name 성명
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 90부서의 사원들을 출력하시오
SELECT * FROM employees WHERE department_id = 90;
-- 단일행서브쿼리
-----------
-- 최대급여를 받는 사원과 같은 부서에서 근무하는 사원들을 출력하시오--2건
-- 0) 최대급여를 계산한다
-- 1)0)과 같은 급여를 받는사원의 부서번호를 검색한다]
-- 2) 1)과 같은 부서번호를 갖는 사원을 검색한다
SELECT *
FROM employees
WHERE department_id =(SELECT department_id
                    FROM employees
                    WHERE salary = (SELECT MAX(salary)
                                   FROM employees)
                                   );
                                   
----------------------
--여러행 서브쿼리
-- 부서별 평균급여를 출력하시오
SELECT department_id, TO_CHAR(ROUND(AVG(salary),1), '99,999.0') 
FROM employees 
GROUP BY department_id;

-- 부서별 평균급여보다 많은 급여를 받는 사원들을 출력하시오
SELECT employee_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- 부서별 평균급여보다 많은 급여를 받는 사원들을 출력하시오 x 
1) 부서별 평균급여계산한다
2) 1) 보다 많은 급여를 갖는 사원을 출력
SELECT department_id, employee_id, salary 
FROM employees
WHERE salary IN
(SELECT AVG(salary) FROM employees GROUP BY department_id) ; 


-- 부서별 최소급여를 받는 사원들을 출력하시오 x 
--1) 부서별 최소급여를 받는 사원들을 출력하시오
--2) 1)와 같은 급여를 받는 사원 출력
SELECT department_id, employee_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                    FROM employees
            GROUP BY department_id);

--직책이 (job_title)이 'President'인 사원의 사번, 이름을 출력하시오
SELECT employee_id, first_name 
FROM employees
WHERE job_id = (SELECT job_id FROM jobs WHERE job_title='President');

--직책이 (job_title)이 'President'가 아닌 사원의 사번, 이름을 출력하시오
SELECT employee_id, first_name 
FROM employees
WHERE job_id <> (SELECT job_id FROM jobs WHERE job_title='President');

SELECT employee_id, first_name 
FROM employees
WHERE job_id IN(SELECT job_id FROM jobs WHERE job_title <>'President');

-- 성이 'Davies'인 사원과 같은 부서에 근무하는 사원들의 사번, 성, 이름을 출력하시오-
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN(SELECT department_id FROM employees WHERE last_name = 'Davies');

SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name <>'Davies' AND department_id IN(SELECT department_id FROM employees WHERE last_name = 'Davies');

-- 'Sales'부서의 평균급여보다 많은 급여를 받는 'Salaes'부서의 사원들을 출력하시오
-- 1-1) 'Sales'부서명의 부서번호를 검색한다
-- 1-2) 'Sales'부서명의 평균급여계산한다.
-- 2) 1-1)과 같은 부서사원이고 1-2) 보다 큰 급여를 받는 사원을 출력한다
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

--상호연관서브쿼리로 해결한다.
           
SELECT department_id, employee_id, salary
FROM employees maine
WHERE department_id = (SELECT department_id 
                        FROM departments 
                        WHERE department_name='Sales')
                        
AND salary > (SELECT AVG(salary) FROM employees
                    WHERE department_id = 
                        maine.department_id);
                        
-- 사원이 1명이라도 있는 부서를 출력하시오
SELECT *
FROM departments d
WHERE EXISTS (SELECT * 
             FROM employees 
             WHERE department_id = d.department_id); //exist 는 상호연관 서브쿼리를 써야함. 서브쿼리에서만 쓸수있음.
             
-- 사원이 1명도 없는 부서를 출력하시오
SELECT *
FROM departments d
WHERE NOT EXISTS (SELECT * 
             FROM employees 
             WHERE department_id = d.department_id); //exist 는 상호연관 서브쿼리를 써야함. 서브쿼리에서만 쓸수있음.
             
             
             
------------------------------------------------
-- INLINE VIEW

--rownum : 행번호를 알려주는 의사컬럼 
SELECT rownum, employee_id, salary
FROM employees
WHERE salary > 10000;

--처리순서
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
SELECT rownum, employee_id, salary
FROM employees
WHERE salary > 10000
ORDER BY salary DESC; -- rownum 발급시점은 SELECT 시점.

-- 급여가 10000보다 많은 사원부터 출력하시오.
-- 단 행번호를 순차 출력한다 // 급여가 많은순으로 순차출력.
SELECT rownum, a.*
FROM (SELECT employee_id, salary
      FROM employees
      WHERE salary > 10000
      ORDER BY salary DESC) a;

-- 급여가 10000보다 많은 사원부터 출력하시오.
-- 단 행번호를 순차출력한다
-- 1행~5행까지만 출력한다
SELECT rownum, a.*
FROM (SELECT employee_id, salary
      FROM employees
      WHERE salary > 10000
      ORDER BY salary DESC) a
--WHERE rownum <6;
WHERE rownum BETWEEN 1 AND 5;

-- 급여가 10000보다 많은 사원부터 출력하시오.
-- 단 행번호를 순차출력한다
-- 6행~10행까지만 출력한다
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

-- sclar subquery : SELECT절에 작성하는 subquery를 scalry query.
-- 'Seattle', 'Toronto'도시에  근무하는 
-- 사원들의 도시명,사번, 이름, 부서ID, 부서명 을 출력하시오
SELECT city, employee_id, first_name, d.department_id, d.department_name 
FROM employees e JOIN departments d ON(e.department_id = d.department_id)
                 JOIN locations l ON(d.location_id = l.location_id)
WHERE l.city IN ('Seattle', 'Toronto');

-- 사원들의 사번, 이름, 부서ID, 부서명 을 출력하시오
SELECT employee_id, first_name, department_id
    ,(SELECT department_name FROM departments d
      WHERE d.department_id = e.department_id)
FROM employees e;

--------------------
--- 사원들의 사번, 이름, 부서ID, 부서명, 도시명을 출력하시오 (scalar
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

-- 'Seattle', 'Toronto'도시에  근무하는 
-- 사원들의 도시명,사번, 이름, 부서ID, 부서명 을 출력하시오 -- Scalar 만으로는 x,  join없이 해보기.
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