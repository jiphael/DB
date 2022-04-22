SELECT id, name
FROM customer;

CREATE VIEW customer_1_vu
AS SELECT id, name
FROM customer;

CREATE OR REPLACE VIEW customer_1_vu
AS SELECT id, name
FROM customer;

SELECT *
FROM customer_1_vu;

-- ���պ丸���
SELECT order_no, order_id, name, TO_CHAR(order_dt, 'YY/MM/DD HH24:MI:SS')
FROM order_info JOIN customer ON (order_id = id);

CREATE OR REPLACE VIEW order_info_1_vu
AS SELECT order_no no, order_id id, name, TO_CHAR(order_dt, 'YY/MM/DD HH24:MI:SS') "dt"
FROM order_info JOIN customer ON (order_id = id);

SELECT * FROM order_info_1_vu;

CREATE OR REPLACE VIEW order_info_1_vu(no, id, name, dt)
AS SELECT order_no , order_id , name, TO_CHAR(order_dt, 'YY/MM/DD HH24:MI:SS') 
FROM order_info JOIN customer ON (order_id = id);

--�ܼ��� : DML ó�� ��
DESC customer_1_vu;
UPDATE customer_1_vu SET name= 'test';

-- ���պ� : DML ó�� ����
DESC order_info_1_vu;
INSERT INTO order_info_1_vu(no, id, name, dt) VALUES(9, 'id9', 'test', SYSDATE); --  <- �����߻�, �������� ���� �����̵� ����߱� ����. 
-------------









