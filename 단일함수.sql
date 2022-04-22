-- 문자함수
SELECT LOWER('AbCdEf'), UPPER('AbCdEf') , INITCAP('abCdEf')
FROM dual;

SELECT LENGTH('AbCdEf'), LENGTH('가'), LENGTHB('AbCdEf'), LENGTHB('가')
FROM dual;

SELECT INSTR('hellojava', 'a'),--7
INSTR('hellojava', 'a', 8),--9
INSTR('hellojava', 'a', 1, 2),--9,
INSTR('hellojava', 'b'),-- 없는글자, 0을반환 
INSTR('hellojava', 'a', -1, 2)-- 7 
FROM dual; --7                          9

SELECT LPAD('abc', 5, '*'), RPAD('abc', 5, '*')
FROM dual;

SELECT TRIM( LEADING 'a' FROM 'aABCaDEFaGHa')
     , TRIM (TRAILING 'a' FROM 'aABCaDEFaGHa')
     , TRIM (BOTH 'a' FROM 'aABCaDEFaGHa')
FROM dual;

SELECT REPLACE('JACK and JUE','J','BL') --BLACK and BLUE
    ,Translate('JACK and JUE','J','BL') --BACK and BUE
FROM dual;
------------------
--숫자관련함수
SELECT MOD(10, 2), MOD(10,0)
FROM dual; --0      10

SELECT ROUND(45.923, 2) --45.92
       ,ROUND(45.923, 0) -- 46
       ,ROUND(45.923) -- 46
       ,ROUND(45.923, -1) --50
       
       ,TRUNC(45.923, 2) --45.92
       ,TRUNC(45.923, 0) -- 45
       ,TRUNC(45.923) -- 45
       ,TRUNC(45.923, -1) --40
FROM dual;

SELECT *
FROM jobs;

-- 직무명에 manager를 포함한 모든 직무를 출력하시오
-- 직무명은 대소문자 구분안함
SELECT *
FROM jobs
WHERE LOWER(job_title) LIKE '%manager%';

-- 사원이름에 'an'을 포함한 사원의 사번과 이름을 출력하시오
-- 1. LIKE연산자로 해결
SELECT first_name,employee_id
FROM employees
WHERE first_name LIKE '%an%';

-- 2. INSTR()함수로 해결
SELECT first_name,employee_id
FROM employees
WHERE INSTR(first_name, 'an')>0 ;

-- 3. SUBSTR()함수로 해결 ?? > 하나씩 찾아줘야하는데 반복문이 더 포함이 되어야하나 sql은 되지 않음. 혼자는 해결하기는 힘들다.
SELECT first_name, employee_id
FROM employees
WHERE SUBSTR(first_name, INSTR(first_name, 'an'), 2) = 'an';

-- 날짜함수 
SELECT SYSDATE
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -10)
FROM dual;

SELECT MONTHS_BETWEEN(SYSDATE, '19/09/01')
FROM dual;

SELECT MONTHS_BETWEEN(SYSDATE, '20190901') --권장안함
FROM dual;

-- 사원의 근무일수, 근무개월수를 출력하시오
-- 소수점이하값은 버림처리한다
SELECT  employee_id
        ,TRUNC(SYSDATE-hire_date, 0) "근무 일수 "
        ,TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "근무 개월수 "
FROM employees
--ORDER BY "근무 일수 ";
ORDER BY 2;

SELECT NEXT_DAY(SYSDATE, '토요일') --   '토')
FROM dual;