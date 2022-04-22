--상품목록보기
SELECT prod_no, prod_name, prod_price
FROM product;

--1페이지에 해당하는 상품목록보기 (페이지당 3건씩, 상품번호순으로 오름차순)
SELECT *
FROM(SELECT rownum rn, a.*
    FROM ( SELECT * FROM product ORDER BY prod_no ) a)
WHERE rn BETWEEN 1 AND 3;
--2페이지
SELECT *
FROM(SELECT rownum rn, a.*
    FROM ( SELECT * FROM product ORDER BY prod_no ) a)
WHERE rn BETWEEN 4 AND 6;

--상품을 상품번호로 검색하기
SELECT *
FROM product
WHERE prod_no='C0001';
--상품을 상품번호의 첫문자가 'C'인 상품들을 검색하기
--('C'-커피, 'S'-여름계절상품, 'F'-음식, 'R'-음료, 'T'-차)
SELECT *
FROM product
--WHERE prod_no LIKE 'C%'; --> 처리속도가 느림
WHERE INSTR(prod_no, 'C') =1;
--WHERE SUBSTR(pro_no, 1, 1) = 'C';

--상품을 상품명으로 검색하기
SELECT *
FROM product
WHERE prod_name LIKE '%아메%'
ORDER BY prod_name ASC;

--주문기본정보를 출력하시오
SELECT *
FROM order_info;
--주문상세정보를 출력하시오
SELECT *
FROM order_line;

--주문기본정보와 상세정보를 검색하기
--주문번호order_no, 주문자ID order_id, 주문일자order_dt, 주문된 상품번호order_prod_no, 주문 수량 order_quantity
SELECT info.order_no, order_id, order_dt, order_prod_no, order_quantity
FROM order_info info JOIN order_line line ON (info.order_no = line.order_no)
ORDER BY info.order_no DESC;

--'id1'고객이 주문한 주문기본정보와 상세정보를 검색하기
SELECT info.order_no, order_id, order_dt, order_prod_no, order_quantity
FROM order_info info JOIN order_line line ON (info.order_no = line.order_no)
WHERE order_id = 'id1'
ORDER BY info.order_no DESC;

--주문기본정보와 상세정보를 검색
--주분번호, 주문자ID, 주문일자, 주문된 상품번호, 상품명, 가격 * 주문수량 금액 확인
SELECT info.order_no, order_id, order_dt, order_prod_no, prod_name, order_quantity, prod_price*order_quantity
FROM order_info info JOIN order_line line ON (info.order_no = line.order_no)
        JOIN product p ON (line.order_prod_no = p.prod_no)
ORDER BY info.order_no DESC;

------------------------------------------------
--주문된 상품 목록을 출력하시오 (상품번호, 상품명, 주문번호, 주문수량)
--단, 주문되지 않은 상품도 출력한다
SELECT prod_no, prod_name, order_no, order_quantity
FROM product p LEFT JOIN order_line ol ON (p.prod_no = ol.order_prod_no);


--상품별 주문수량의 합을 구하시오(상품번호, 주문수량합)
--주문수량이 많은 상품부터 출력하시오
SELECT prod_no, SUM(order_quantity)
FROM product p JOIN order_line ol ON (p.prod_no = ol.order_prod_no)
GROUP BY prod_no
ORDER BY 2 DESC;

--상품별 주문수량의 합을 구하시오(상품번호, 주문수량합)
--주문일자가 20/06/08인 주문중 주문수량이 많은 상품부터 출력하시오
SELECT TO_CHAR(order_dt, 'YYYY/MM/DD HH24:MI:SS')
FROM order_info
--WHERE order_dt >= '20/06/09' AND order_dt < '20/06/10'; --> ='20/06/09' 이렇게 하면 안됨 시분초 값이 0시0분0초가 되기 때문에 같지 않음.
WHERE TO_CHAR(order_dt, 'YY/MM/DD') = '20/06/09';

--1)주문일자가 20/06/08인 주문번호를 검색한다
--2) 1)와 같은 주문번호를 갖는 주문상세(상품번호, 수량합 출력한다
SELECT order_prod_no, SUM(order_quantity)
FROM order_line
WHERE order_no IN (SELECT order_no
                    FROM order_info
                    WHERE TO_CHAR(order_dt, 'YY/MM/DD') = '20/06/09')
GROUP BY order_prod_no
ORDER BY 2 DESC;

--주문되지 않은 상품번호를 출력하시오
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

