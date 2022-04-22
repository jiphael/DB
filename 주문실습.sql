--��ǰ��Ϻ���
SELECT prod_no, prod_name, prod_price
FROM product;

--1�������� �ش��ϴ� ��ǰ��Ϻ��� (�������� 3�Ǿ�, ��ǰ��ȣ������ ��������)
SELECT *
FROM(SELECT rownum rn, a.*
    FROM ( SELECT * FROM product ORDER BY prod_no ) a)
WHERE rn BETWEEN 1 AND 3;
--2������
SELECT *
FROM(SELECT rownum rn, a.*
    FROM ( SELECT * FROM product ORDER BY prod_no ) a)
WHERE rn BETWEEN 4 AND 6;

--��ǰ�� ��ǰ��ȣ�� �˻��ϱ�
SELECT *
FROM product
WHERE prod_no='C0001';
--��ǰ�� ��ǰ��ȣ�� ù���ڰ� 'C'�� ��ǰ���� �˻��ϱ�
--('C'-Ŀ��, 'S'-����������ǰ, 'F'-����, 'R'-����, 'T'-��)
SELECT *
FROM product
--WHERE prod_no LIKE 'C%'; --> ó���ӵ��� ����
WHERE INSTR(prod_no, 'C') =1;
--WHERE SUBSTR(pro_no, 1, 1) = 'C';

--��ǰ�� ��ǰ������ �˻��ϱ�
SELECT *
FROM product
WHERE prod_name LIKE '%�Ƹ�%'
ORDER BY prod_name ASC;

--�ֹ��⺻������ ����Ͻÿ�
SELECT *
FROM order_info;
--�ֹ��������� ����Ͻÿ�
SELECT *
FROM order_line;

--�ֹ��⺻������ �������� �˻��ϱ�
--�ֹ���ȣorder_no, �ֹ���ID order_id, �ֹ�����order_dt, �ֹ��� ��ǰ��ȣorder_prod_no, �ֹ� ���� order_quantity
SELECT info.order_no, order_id, order_dt, order_prod_no, order_quantity
FROM order_info info JOIN order_line line ON (info.order_no = line.order_no)
ORDER BY info.order_no DESC;

--'id1'���� �ֹ��� �ֹ��⺻������ �������� �˻��ϱ�
SELECT info.order_no, order_id, order_dt, order_prod_no, order_quantity
FROM order_info info JOIN order_line line ON (info.order_no = line.order_no)
WHERE order_id = 'id1'
ORDER BY info.order_no DESC;

--�ֹ��⺻������ �������� �˻�
--�ֺй�ȣ, �ֹ���ID, �ֹ�����, �ֹ��� ��ǰ��ȣ, ��ǰ��, ���� * �ֹ����� �ݾ� Ȯ��
SELECT info.order_no, order_id, order_dt, order_prod_no, prod_name, order_quantity, prod_price*order_quantity
FROM order_info info JOIN order_line line ON (info.order_no = line.order_no)
        JOIN product p ON (line.order_prod_no = p.prod_no)
ORDER BY info.order_no DESC;

------------------------------------------------
--�ֹ��� ��ǰ ����� ����Ͻÿ� (��ǰ��ȣ, ��ǰ��, �ֹ���ȣ, �ֹ�����)
--��, �ֹ����� ���� ��ǰ�� ����Ѵ�
SELECT prod_no, prod_name, order_no, order_quantity
FROM product p LEFT JOIN order_line ol ON (p.prod_no = ol.order_prod_no);


--��ǰ�� �ֹ������� ���� ���Ͻÿ�(��ǰ��ȣ, �ֹ�������)
--�ֹ������� ���� ��ǰ���� ����Ͻÿ�
SELECT prod_no, SUM(order_quantity)
FROM product p JOIN order_line ol ON (p.prod_no = ol.order_prod_no)
GROUP BY prod_no
ORDER BY 2 DESC;

--��ǰ�� �ֹ������� ���� ���Ͻÿ�(��ǰ��ȣ, �ֹ�������)
--�ֹ����ڰ� 20/06/08�� �ֹ��� �ֹ������� ���� ��ǰ���� ����Ͻÿ�
SELECT TO_CHAR(order_dt, 'YYYY/MM/DD HH24:MI:SS')
FROM order_info
--WHERE order_dt >= '20/06/09' AND order_dt < '20/06/10'; --> ='20/06/09' �̷��� �ϸ� �ȵ� �ú��� ���� 0��0��0�ʰ� �Ǳ� ������ ���� ����.
WHERE TO_CHAR(order_dt, 'YY/MM/DD') = '20/06/09';

--1)�ֹ����ڰ� 20/06/08�� �ֹ���ȣ�� �˻��Ѵ�
--2) 1)�� ���� �ֹ���ȣ�� ���� �ֹ���(��ǰ��ȣ, ������ ����Ѵ�
SELECT order_prod_no, SUM(order_quantity)
FROM order_line
WHERE order_no IN (SELECT order_no
                    FROM order_info
                    WHERE TO_CHAR(order_dt, 'YY/MM/DD') = '20/06/09')
GROUP BY order_prod_no
ORDER BY 2 DESC;

--�ֹ����� ���� ��ǰ��ȣ�� ����Ͻÿ�
SELECT *
FROM product
WHERE prod_no IN (SELECT prod_no
from product
minus
select order_prod_no
from order_line);

SELECT prod_no, SUM(order_quantity)
FROM product p JOIN order_line ol ON (p.prod_no = ol.order_prod_no)
 (SELECT order_dt FROM order_info oi WHERE ol.order_no = oi.order_no)
GROUP BY prod_no
ORDER BY 2 DESC;

------------
SELECT * FROM product;
SELECT * FROM order_info;
SELECT * FROM order_line;

