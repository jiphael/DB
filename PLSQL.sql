SET SERVEROUTPUT ON -- 출력모드 on

execute p1(1,2); -- 변수선언및 사용

--IF
execute p2(60); 

execute p3;

--CURSOR : 여러행 검색에 필요
execute p4;


--함수는 반환값이 반드시 있다
-- 반환값이 대입되는 변수는 var또는 variable로 선언한다
-- 변수에 대입할때는 :q변수명 := 함수;
-- 변수값을 출력할때는 print명령어 사용한다
var msg VARCHAR2;
execute :msg := f1;
print msg;

SELECT f1 FROM dual;
SELECT id || ' ' || f1 FROM customer;
----------------

-- 고객이 주문하면 포인트점수가 누적된다
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


-- 아래프로시저를 시행하면 고객테이블에 행이 추가되고 포인트 테이블에도 행이 추가된다
exec p_insert_customer('id1', 'p1', 'n3');

---------------
-- 트리거 테스트
-- 주문기본정보(order_info)이 추가되면 자동 POINT(point)가 1점 누적된다
INSERT INTO order_info(order_no, order_id, order_dt)
VALUES (order_seq.NEXTVAL, 'id1', SYSDATE);

SELECT * FROM order_info;
SELECT * FROM order_line;
select * from point;

-- 주문트랜잭션
-- 1) 주문기본정보 추가
--          2) 포인트점수 누적 :자동
-- 3) 주문상세정보 추가

INSERT INTO order_line(order_no, order_prod_no, order_quantity)
VALUES (order_seq.CURRVAL, 'C0001', 1);
commit;