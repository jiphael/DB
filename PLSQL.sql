SET SERVEROUTPUT ON -- ��¸�� on

execute p1(1,2); -- ��������� ���

--IF
execute p2(60); 

execute p3;

--CURSOR : ������ �˻��� �ʿ�
execute p4;


--�Լ��� ��ȯ���� �ݵ�� �ִ�
-- ��ȯ���� ���ԵǴ� ������ var�Ǵ� variable�� �����Ѵ�
-- ������ �����Ҷ��� :q������ := �Լ�;
-- �������� ����Ҷ��� print��ɾ� ����Ѵ�
var msg VARCHAR2;
execute :msg := f1;
print msg;

SELECT f1 FROM dual;
SELECT id || ' ' || f1 FROM customer;
----------------

-- ���� �ֹ��ϸ� ����Ʈ������ �����ȴ�
CREATE TABLE point(
point_id VARCHAR(10),
point_score NUMBER(4) DEFAULT 0 NOT NULL,
CONSTRAINT point_id_pk PRIMARY KEY(point_id),
CONSTRAINT point_id_fk FOREIGN KEY(point_id) REFERENCES customer(id)
);
select * from customer;
select * FROM point;

DELETE order_line;
DELETE order_info;
DELETE customer;
commit;


-- �Ʒ����ν����� �����ϸ� �����̺� ���� �߰��ǰ� ����Ʈ ���̺��� ���� �߰��ȴ�
exec p_insert_customer('id1', 'p1', 'n3');

---------------
-- Ʈ���� �׽�Ʈ
-- �ֹ��⺻����(order_info)�� �߰��Ǹ� �ڵ� POINT(point)�� 1�� �����ȴ�
INSERT INTO order_info(order_no, order_id, order_dt)
VALUES (order_seq.NEXTVAL, 'id1', SYSDATE);

SELECT * FROM order_info;
SELECT * FROM order_line;
select * from point;

-- �ֹ�Ʈ�����
-- 1) �ֹ��⺻���� �߰�
--          2) ����Ʈ���� ���� :�ڵ�
-- 3) �ֹ������� �߰�

INSERT INTO order_line(order_no, order_prod_no, order_quantity)
VALUES (order_seq.CURRVAL, 'C0001', 1);
commit;