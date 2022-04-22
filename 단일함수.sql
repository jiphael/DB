-- �����Լ�
SELECT LOWER('AbCdEf'), UPPER('AbCdEf') , INITCAP('abCdEf')
FROM dual;

SELECT LENGTH('AbCdEf'), LENGTH('��'), LENGTHB('AbCdEf'), LENGTHB('��')
FROM dual;

SELECT INSTR('hellojava', 'a'),--7
INSTR('hellojava', 'a', 8),--9
INSTR('hellojava', 'a', 1, 2),--9,
INSTR('hellojava', 'b'),-- ���±���, 0����ȯ 
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
--���ڰ����Լ�
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

-- ������ manager�� ������ ��� ������ ����Ͻÿ�
-- �������� ��ҹ��� ���о���
SELECT *
FROM jobs
WHERE LOWER(job_title) LIKE '%manager%';

-- ����̸��� 'an'�� ������ ����� ����� �̸��� ����Ͻÿ�
-- 1. LIKE�����ڷ� �ذ�
SELECT first_name,employee_id
FROM employees
WHERE first_name LIKE '%an%';

-- 2. INSTR()�Լ��� �ذ�
SELECT first_name,employee_id
FROM employees
WHERE INSTR(first_name, 'an')>0 ;

-- 3. SUBSTR()�Լ��� �ذ� ?? > �ϳ��� ã������ϴµ� �ݺ����� �� ������ �Ǿ���ϳ� sql�� ���� ����. ȥ�ڴ� �ذ��ϱ�� �����.
SELECT first_name, employee_id
FROM employees
WHERE SUBSTR(first_name, INSTR(first_name, 'an'), 2) = 'an';

-- ��¥�Լ� 
SELECT SYSDATE
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -10)
FROM dual;

SELECT MONTHS_BETWEEN(SYSDATE, '19/09/01')
FROM dual;

SELECT MONTHS_BETWEEN(SYSDATE, '20190901') --�������
FROM dual;

-- ����� �ٹ��ϼ�, �ٹ��������� ����Ͻÿ�
-- �Ҽ������ϰ��� ����ó���Ѵ�
SELECT  employee_id
        ,TRUNC(SYSDATE-hire_date, 0) "�ٹ� �ϼ� "
        ,TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "�ٹ� ������ "
FROM employees
--ORDER BY "�ٹ� �ϼ� ";
ORDER BY 2;

SELECT NEXT_DAY(SYSDATE, '�����') --   '��')
FROM dual;