--자동형변환
SELECT 1+'2', 1||'2', --'20/04/27' +1
FROM dual;

--강제형변환
-- 날짜 > 문자 : TO_CHAR
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY/MM/DD/ HH24:MI:SS DAY')
FROM dual;

-- 7월 입사자들만 출력하시오
SELECT *  
FROM employees
WHERE TO_CHAR(hire_date,'MM')= '07';
-- WHERE SUBSTR(TO_CHAR(hire_date), 4, 2)= '07';

-- 하반기 입사자들만 출력하시오(하반기:7~12)
SELECT *  
FROM employees
WHERE TO_CHAR(hire_date,'MM')>= '07';

-- 숫자 > 문자 : TO_CHAR
SELECT TO_CHAR(1234.5, '99,999'), TO_CHAR(1234.5, '99,999.000')
,TO_CHAR(1234.5, 'L99,999.000')
FROM dual;

-- 문자 > 날짜 : TO_DATE
SELECT TO_DATE('20/01/03') +1 --20/01/04
    , TO_DATE('2020/01/03') +1 -- 20/01/04
    , TO_DATE('20200103') +1 --20/01/04
    , TO_DATE('01032020', 'MMDDYYYY') +1 --20/01/04
FROM dual;
-- 문자 > 숫자 : TO_NUMBER
SELECT TO_NUMBER('1,234', '9,999')
FROM dual;

-- 숫자 200601을 날짜형으로 변환후 다음일자의 요일을 출력하시오
SELECT TO_CHAR(TO_DATE(TO_CHAR('200601'),'YYMMDD')+1,'DAY')
      ,TO_CHAR(TO_DATE(TO_CHAR('200601'),'YYMMDD')-1,'DAY')
FROM dual;

SELECT TO_CHAR(TO_DATE('201225','YYMMDD'),'DAY')
FROM dual;

SELECT TO_CHAR(TO_DATE('930313','YYMMDD'),'DAY')
FROM dual;

SELECT TO_CHAR(TO_DATE('991231','RRMMDD'),'DAY'),TO_CHAR(TO_DATE('991231','YYMMDD'),'DAY') --rr 과거 yy 다가올미래 가장좋은거 년도4자리, 지나간건 rr로표기.
FROM dual;

-- 수업일수를 출력하시오.
SELECT SYSDATE -TO_DATE('20/04/21')
FROM dual;

-- 일반함수
-- 관리자 없는 사원을 출력하시오
SELECT *
FROM employees
WHERE manager_id IS NULL;

-- 관리자가 있는 사원들은 사번, 이름, 관리자번호, '관리자 있음' 을 출력하고 
--         없는 사원들은 사번, 이름, 관리자번호, '관리자없음'을 출력하시오
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '관리자있음', '관리자없음')
FROM employees;

-- 관리자가 있는 사원들은 사번, 이름, 관리자번호를 출력하고
--         없는         사번, 이름, 관리자없음을 출력하시오.

SELECT employee_id, first_name, manager_id
-- NVL2(manager_id, TO_CHAR(manager_id), '관리자없음')
--CASE NVL(manager_id,-1) WHEN -1 THEN '관리자없음'
--                ELSE TO_CHAR(manager_id)
 --               END
--COALESCE(TO_CHAR(manager_id),'관리자없음')
,DECODE(manager_id, null, '관리자없음', manager_id)
FROM employees;

SELECT DISTINCT salary FROM employees ORDER BY salary DESC;

-- 사원의 사번, 급여, 급여등급
-- 급여가 10000이상인 경우 'A'
-- 급여가 5000이상인 경우 'B'
--           미만인 경우 'C'
-- 등급을 출력하시오

SELECT employee_id, salary,
 -- CASE WHEN salary >=10000 THEN 'A'
    --  WHEN salary>=5000 THEN 'B'
    --  ELSE 'C'
    --  END 급여등급
--COALESCE(TO_CHAR(manager_id),'관리자없음')
 DECODE(TRUNC(salary/5000, 0)
                ,0, 'c'
                ,1, 'b'
                  , 'a')
FROM employees;

SELECT DISTINCT salary FROM employees ORDER BY salary DESC;
