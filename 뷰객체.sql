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

-- 복합뷰만들기
SELECT order_no, order_id, name, TO_CHAR(order_dt, 'YY/MM/DD HH24:MI:SS')
FROM order_info JOIN customer ON (order_id = id);

CREATE OR REPLACE VIEW order_info_1_vu
AS SELECT order_no no, order_id id, name, TO_CHAR(order_dt, 'YY/MM/DD HH24:MI:SS') "dt"
FROM order_info JOIN customer ON (order_id = id);

SELECT * FROM order_info_1_vu;

CREATE OR REPLACE VIEW order_info_1_vu(no, id, name, dt)
AS SELECT order_no , order_id , name, TO_CHAR(order_dt, 'YY/MM/DD HH24:MI:SS') 
FROM order_info JOIN customer ON (order_id = id);

--단순뷰 : DML 처리 편리
DESC customer_1_vu;
UPDATE customer_1_vu SET name= 'test';

-- 복합뷰 : DML 처리 불편
DESC order_info_1_vu;
INSERT INTO order_info_1_vu(no, id, name, dt) VALUES(9, 'id9', 'test', SYSDATE); --  <- 오류발생, 존재하지 않은 고객아이디를 등록했기 때문. 
-------------









