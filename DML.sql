INSERT INTO customer(id, pwd) VALUES ('id2', 'p2');
INSERT INTO customer(id, pwd) VALUES ('id3', 'p3');

INSERT INTO order_info(order_no, order_id) VALUES (1, 'id1');
INSERT INTO order_info(order_no, order_id) VALUES (2, 'id1');

INSERT INTO product VALUES ('C0001', '�Ƹ޸�ī��', 1000);
INSERT INTO product VALUES ('C0002', '���̽��Ƹ޸�ī��', 1000);
INSERT INTO product VALUES ('S0001', '�����ֽ�', 4000);
INSERT INTO product VALUES ('S0002', '�Ϻ���', 8000);

INSERT INTO order_line VALUES (1, 'S0001', 1);
INSERT INTO order_line VALUES (1, 'C0001', 4);
INSERT INTO order_line VALUES (1, 'C0002', 2);
INSERT INTO order_line VALUES (2, 'C0001', 1);
