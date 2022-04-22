-- 사원의 사번, 현재직무번호, 이전직무번호를 출력하시오
-- 단, 이전직무가 없는 사원도 출력한다
-- 사번, 현재직무번호, 이전직무번호
SELECT e.employee_id, e.job_id "현재직무번호", jh.job_id "이전직무번호"
FROM employees e 
     LEFT JOIN job_history jh ON (e.employee_id = jh.employee_id)
ORDER BY e.employee_id, jh.job_id;

-------------
-- 합집합 : UNION ALL :중복값제거 x ,자동정렬x
--         UNION : 중복된값제거, 자동정렬, 첫번째컬럼으로 오름차순정렬이됨.
SELECT employee_id "사번", job_id "업무1"
FROM employees
UNION
SELECT  employee_id, job_id "업무2"
FROM job_history;

--UNION ALL :중복포함 --117건, 자동정렬x
SELECT employee_id "사번", job_id "업무1"
FROM employees
UNION ALL
SELECT  employee_id, job_id "업무2"
FROM job_history
ORDER BY "사번";

-- 이전업무와 같은 현재 업무를 담당하는 사원들의 사번, 업무번호를 출력하시오
SELECT employee_id "사번", job_id "업무1"
FROM employees
INTERSECT
SELECT  employee_id, job_id "업무2"
FROM job_history
ORDER BY "사번";

SELECT e.employee_id, e.job_id "업무"
FROM employees e 
     JOIN job_history jh ON (e.employee_id = jh.employee_id)
WHERE jh.job_id =  e.job_id
ORDER BY e.employee_id ;

-- 현재업무와 다른 이전업무를 담당했던 사원들의 사번, 이전업무를 출력하시오.
SELECT  employee_id "사번", job_id "이전업무"
FROM job_history
MINUS
SELECT employee_id , job_id "현재업무"
FROM employees
ORDER BY "사번";

-- 현재업무와 다른 이전업무를 담당했던 사원들의 사번, 현재업무를 출력하시오.
SELECT  employee_id "사번", job_id "현재업무"
FROM employees
MINUS
SELECT employee_id , job_id "이전업무"
FROM job_history
ORDER BY "사번";

-- 이전업무경력이 있는 사원의 사번을 출력하시오
SELECT employee_id
FROM job_history;

-- 이전업무경력이 있는 사원의 사번을 출력하시오
-- 중복하지 않는다
SELECT UNIQUE employee_id
FROM job_history;

SELECT DISTINCT employee_id
FROM job_history;

-- 이전업무경력이 없는 사원의 사번을 출력하시오
SELECT employee_id
FROM employees
MINUS
SELECT employee_id
FROM job_history
ORDER BY employee_id;
