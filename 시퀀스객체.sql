CREATE SEQUENCE order_seq
START WITH 3
INCREMENT BY 2
MAXVALUE 40
MINVALUE 1
CYCLE;

SELECT order_seq.NEXTVAL
    , order_seq.CURRVAL
FROM dual; 

DROP SEQUENCE order_seq;

CREATE SEQUENCE order_seq
START WITH 3;

--- 주문정보 추가하기
INSERT INTO order_info(order_no, order_id, order_dt)
VALUES (order_seq.NEXTVAL,  'id3', SYSDATE);
SELECT * FROM order_info;

INSERT INTO order_line(order_no, order_prod_no, order_quantity)
VALUES                (order_seq.CURRVAL, 'C0001' , 1);
SELECT * FROM order_line;
commit;