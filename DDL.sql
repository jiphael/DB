-- ���̺�� : ORDER_INFO
-- �÷���
-- ORDER_NO NUMBER
-- ORDER_ID VARCHAR2(10)
-- ORDER_DT DATE  �ڵ����� ����������ϴ°�� ��¥Ÿ��, ���� �����Է� ����Ÿ���� ����.

CREATE TABLE ORDER_INFO(
ORDER_NO NUMBER,
ORDER_ID VARCHAR2(10),
ORDER_DT DATE
);

-- ALTER TABLE �������̺��� ���������ϱ�

-- �����̺� �÷��߰��ϱ�
ALTER TABLE customer
ADD zipcode CHAR(5);

-- �����̺��� �÷��� Ÿ���̳� ���� �����ϱ�
ALTER TABLE customer
MODIFY pwd VARCHAR2(20);

-- �����̺��� �÷��� �����ϱ�
ALTER TABLE customer
RENAME COLUMN zipcode TO zip;

-- �����̺��� �÷� �����ϱ�
ALTER TABLE customer
DROP COLUMN zip;

-- �������̺��� �������� �߰�
ALTER TABLE customer
ADD CONSTRAINT customer_id_pk PRIMARY KEY(id); 

--ALTER TABLE customer
--ADD CONSTRAINT coustomer_pwd_nn NOT NULL(pwd); -- not null�� ���̺����� �������� �߰� ����. �÷������θ�����. ������.
DELETE FROM customer WHERE pwd IS NULL;
SELECT * FROM customer;
ALTER TABLE customer
MODIFY pwd VARCHAR2(20) 
CONSTRAINT coustomer_pwd_nn NOT NULL;

-- �������� �����ϱ�
ALTER TABLE customer 
DROP CONSTRAINT customer_pwd_nn;

-- ���̺��� ����Ǿ��ִ� ������ ���� : user_tables
-- ���������� ����Ǿ��ִ� �����ͻ��� : user_constraints
DESC user_constraints;
SELECT owner, constraint_name, constraint_type, table_name
FROM user_constraints;

-- �����̺�  �̸��÷�(�÷��� : name, Ÿ��: varchar2(20)) �� �߰��Ͻÿ�
ALTER TABLE customer
ADD name varchar2(20);

-- �ֹ��⺻�������̺� 
-- �ֹ���ȣ�÷�(�÷���:order_no)�� PRIMARY KEY���������� �߰��Ͻÿ�.
ALTER TABLE order_info
ADD CONSTRAINT order_info_no_pk PRIMARY KEY(order_no); 

-- �ֹ��ڱ⺻�������̺�
-- �ֹ���ID(�÷��� : order_id)�� NOT NULL���������� �߰��Ͻÿ�
ALTER TABLE order_info
MODIFY order_id CONSTRAINT order_info_id_nn NOT NULL;
--�ֹ���ID�÷��� �����̺��� ��ID�� �����ϵ��� FOREIGN KEY�����������߰��Ͻÿ�
ALTER TABLE order_info
ADD CONSTRAINT order_info_id_fk FOREIGN KEY(order_id)
    REFERENCES customer(id);
    
--�ֹ��⺻�������̺�
--�ֹ�����(order_dt)�� �⺻���� ���ó��ڰ� �ǵ��� �����Ͻÿ�
ALTER TABLE order_info
MODIFY order_dt DEFAULT SYSDATE;

--------------
SELECT *
FROM user_constraints
WHERE table_name='ORDER_INFO';

CREATE TABLE PRODUCT(
prod_no VARCHAR2(5),
prod_name CHAR(30),
prod_price number(7)
);

CREATE TABLE ORDER_LINE(
order_no number,
order_prod_no VARCHAR2(5),
order_quantity VARCHAR2(3)
);

ALTER TABLE product
ADD CONSTRAINT prod_no_pk PRIMARY KEY(prod_no); 

ALTER TABLE order_line
DROP CONSTRAINT order_prod_no;

ALTER TABLE order_line
ADD CONSTRAINT order_line_pk  PRIMARY KEY(order_prod_no, order_prod_no); 
--add constraint >>>�ΰ���̾������. �������ξ���.

ALTER TABLE order_line
ADD CONSTRAINT order_no_fk FOREIGN KEY(order_no)
    REFERENCES order_info (order_no);
    
ALTER TABLE order_line
ADD CONSTRAINT order_prod_no_fk FOREIGN KEY(order_prod_no)
    REFERENCES product (prod_no);
    
DROP TABLE ORDER_LINE;

ALTER TABLE order_line
ADD CONSTRAINT order_line_pk 
    PRIMARY KEY(order_no, order_prod_no)
ADD CONSTRAINT order_line_prod_no_fk 
    FOREIGN KEY(order_prod_no) REFERENCES product(prod_no)
ADD CONSTRAINT order_line_no_fk 
    FOREIGN KEY(order_no) REFERENCES order_info(order_no);

ALTER TABLE product
ADD CONSTRAINT prod_pirce_ck CHECK (prod_price > 0);

ALTER TABLE order_line
MODIFY order_quantity NOT NULL
ADD CONSTRAINT order_line_quantit_ck CHECK (order_quantity > 0);

----------------------
-- SUBQUERY�� �̿��� ���̺� ����
SELECT * FROM customer;
CREATE TABLE copy_customer
AS SELECT * FROM customer;

CREATE TABLE copy_customer1(cid, cpwd)
AS SELECT id, pwd FROM customer;

CREATE TABLE copy_customer2
AS SELECT * FROM customer WHERE 1=0;

INSERT INTO customer(id, pwd)
VALUES ('id2','p2');

INSERT INTO customer(id, pwd)
VALUES ('id3','p3');
INSERT INTO ORDER_INFO(ORDER_NO, ORDER_ID,ORDER_DT)
VALUES (1,'id1','20/06/08');
INSERT INTO ORDER_INFO(ORDER_NO, ORDER_ID,ORDER_DT)
VALUES (2,'id1','20/06/08');

INSERT INTO product(pord_no, prod_name, prod_price)
VALUES ('C001','�Ƹ޸�ī��','1000');