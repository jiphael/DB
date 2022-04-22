--�ڵ�����ȯ
SELECT 1+'2', 1||'2', --'20/04/27' +1
FROM dual;

--��������ȯ
-- ��¥ > ���� : TO_CHAR
SELECT SYSDATE, TO_CHAR(SYSDATE,'YY/MM/DD/ HH24:MI:SS DAY')
FROM dual;

-- 7�� �Ի��ڵ鸸 ����Ͻÿ�
SELECT *  
FROM employees
WHERE TO_CHAR(hire_date,'MM')= '07';
-- WHERE SUBSTR(TO_CHAR(hire_date), 4, 2)= '07';

-- �Ϲݱ� �Ի��ڵ鸸 ����Ͻÿ�(�Ϲݱ�:7~12)
SELECT *  
FROM employees
WHERE TO_CHAR(hire_date,'MM')>= '07';

-- ���� > ���� : TO_CHAR
SELECT TO_CHAR(1234.5, '99,999'), TO_CHAR(1234.5, '99,999.000')
,TO_CHAR(1234.5, 'L99,999.000')
FROM dual;

-- ���� > ��¥ : TO_DATE
SELECT TO_DATE('20/01/03') +1 --20/01/04
    , TO_DATE('2020/01/03') +1 -- 20/01/04
    , TO_DATE('20200103') +1 --20/01/04
    , TO_DATE('01032020', 'MMDDYYYY') +1 --20/01/04
FROM dual;
-- ���� > ���� : TO_NUMBER
SELECT TO_NUMBER('1,234', '9,999')
FROM dual;

-- ���� 200601�� ��¥������ ��ȯ�� ���������� ������ ����Ͻÿ�
SELECT TO_CHAR(TO_DATE(TO_CHAR('200601'),'YYMMDD')+1,'DAY')
      ,TO_CHAR(TO_DATE(TO_CHAR('200601'),'YYMMDD')-1,'DAY')
FROM dual;

SELECT TO_CHAR(TO_DATE('201225','YYMMDD'),'DAY')
FROM dual;

SELECT TO_CHAR(TO_DATE('930313','YYMMDD'),'DAY')
FROM dual;

SELECT TO_CHAR(TO_DATE('991231','RRMMDD'),'DAY'),TO_CHAR(TO_DATE('991231','YYMMDD'),'DAY') --rr ���� yy �ٰ��ù̷� ���������� �⵵4�ڸ�, �������� rr��ǥ��.
FROM dual;

-- �����ϼ��� ����Ͻÿ�.
SELECT SYSDATE -TO_DATE('20/04/21')
FROM dual;

-- �Ϲ��Լ�
-- ������ ���� ����� ����Ͻÿ�
SELECT *
FROM employees
WHERE manager_id IS NULL;

-- �����ڰ� �ִ� ������� ���, �̸�, �����ڹ�ȣ, '������ ����' �� ����ϰ� 
--         ���� ������� ���, �̸�, �����ڹ�ȣ, '�����ھ���'�� ����Ͻÿ�
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '����������', '�����ھ���')
FROM employees;

-- �����ڰ� �ִ� ������� ���, �̸�, �����ڹ�ȣ�� ����ϰ�
--         ����         ���, �̸�, �����ھ����� ����Ͻÿ�.

SELECT employee_id, first_name, manager_id
-- NVL2(manager_id, TO_CHAR(manager_id), '�����ھ���')
--CASE NVL(manager_id,-1) WHEN -1 THEN '�����ھ���'
--                ELSE TO_CHAR(manager_id)
 --               END
--COALESCE(TO_CHAR(manager_id),'�����ھ���')
,DECODE(manager_id, null, '�����ھ���', manager_id)
FROM employees;

SELECT DISTINCT salary FROM employees ORDER BY salary DESC;

-- ����� ���, �޿�, �޿����
-- �޿��� 10000�̻��� ��� 'A'
-- �޿��� 5000�̻��� ��� 'B'
--           �̸��� ��� 'C'
-- ����� ����Ͻÿ�

SELECT employee_id, salary,
 -- CASE WHEN salary >=10000 THEN 'A'
    --  WHEN salary>=5000 THEN 'B'
    --  ELSE 'C'
    --  END �޿����
--COALESCE(TO_CHAR(manager_id),'�����ھ���')
 DECODE(TRUNC(salary/5000, 0)
                ,0, 'c'
                ,1, 'b'
                  , 'a')
FROM employees;

SELECT DISTINCT salary FROM employees ORDER BY salary DESC;
