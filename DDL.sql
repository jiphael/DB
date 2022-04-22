-- 테이블명 : ORDER_INFO
-- 컬럼들
-- ORDER_NO NUMBER
-- ORDER_ID VARCHAR2(10)
-- ORDER_DT DATE  자동으로 만들어져야하는경우 날짜타입, 내가 직접입력 문자타입이 편함.

CREATE TABLE ORDER_INFO(
ORDER_NO NUMBER,
ORDER_ID VARCHAR2(10),
ORDER_DT DATE
);

-- ALTER TABLE 기존테이블의 구조변경하기

-- 고객테이블에 컬럼추가하기
ALTER TABLE customer
ADD zipcode CHAR(5);

-- 고객테이블의 컬럼의 타입이나 길이 변경하기
ALTER TABLE customer
MODIFY pwd VARCHAR2(20);

-- 고객테이블의 컬럼명 변경하기
ALTER TABLE customer
RENAME COLUMN zipcode TO zip;

-- 고객테이블의 컬럼 제거하기
ALTER TABLE customer
DROP COLUMN zip;

-- 기존테이블의 제약조건 추가
ALTER TABLE customer
ADD CONSTRAINT customer_id_pk PRIMARY KEY(id); 

--ALTER TABLE customer
--ADD CONSTRAINT coustomer_pwd_nn NOT NULL(pwd); -- not null은 테이블레벨로 제약조건 추가 못함. 컬럼레벨로만가능. 오류남.
DELETE FROM customer WHERE pwd IS NULL;
SELECT * FROM customer;
ALTER TABLE customer
MODIFY pwd VARCHAR2(20) 
CONSTRAINT coustomer_pwd_nn NOT NULL;

-- 제약조건 제거하기
ALTER TABLE customer 
DROP CONSTRAINT customer_pwd_nn;

-- 테이블이 저장되어있는 데이터 사전 : user_tables
-- 제약조건이 저장되어있는 데이터사전 : user_constraints
DESC user_constraints;
SELECT owner, constraint_name, constraint_type, table_name
FROM user_constraints;

-- 고객테이블에  이름컬럼(컬럼명 : name, 타입: varchar2(20)) 을 추가하시오
ALTER TABLE customer
ADD name varchar2(20);

-- 주문기본정보테이블에 
-- 주문번호컬럼(컬럼명:order_no)에 PRIMARY KEY제약조건을 추가하시오.
ALTER TABLE order_info
ADD CONSTRAINT order_info_no_pk PRIMARY KEY(order_no); 

-- 주문자기본정보테이블에
-- 주문자ID(컬럼명 : order_id)에 NOT NULL제약조건을 추가하시오
ALTER TABLE order_info
MODIFY order_id CONSTRAINT order_info_id_nn NOT NULL;
--주문자ID컬럼은 고객테이블의 고객ID를 참조하도록 FOREIGN KEY제약조건을추가하시오
ALTER TABLE order_info
ADD CONSTRAINT order_info_id_fk FOREIGN KEY(order_id)
    REFERENCES customer(id);
    
--주문기본정보테이블에
--주문일자(order_dt)는 기본값이 오늘날자가 되도록 변경하시오
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
--add constraint >>>로계속이어갈수있음. 컨마따로없음.

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
-- SUBQUERY를 이용한 테이블 생성
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
VALUES ('C001','아메리카노','1000');