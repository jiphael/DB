--�����ȣ�� ���̺��� ����
CREATE TABLE postal(
zipcode varchar2(5),
sido varchar2(20),
sidoe varchar2(40),
sigungu varchar2(20),
sigungue varchar2(40),
eupmyun varchar2(20),
eupmyune varchar2(40),
dorocode varchar2(12),  --���θ��ڵ�
doro varchar2(80),  --���θ�
doroe varchar2(80),
jiha varchar2(1),
building1 varchar2(5), --�ǹ���ȣ ����
buildingno varchar2(25),  --�ǹ�������ȣ
building2 varchar2(5), --�ǹ���ȣ �ι�
daryang varchar2(40),
building varchar2(200), --�ñ�����ǹ���
dongcode varchar2(10),
dong varchar2(20), --��������
ri varchar2(20),
dongadmin varchar2(40),
san varchar2(1),
zibun1 varchar2(4),
zibunserial varchar2(2),
zibun2 varchar2(4),
zipoldcode varchar2(6),
zipcodeserial varchar2(3));

ALTER TABLE postal
ADD CONSTRAINT postal_buildingno_pk PRIMARY KEY(buildingno);

ALTER TABLE postal
MODIFY sido VARCHAR2(21);

select * from postal;

-- building�÷����� '���б�'�� ����������� ����Ͻÿ�
select *
from postal
where building  like '%���б�%';

select zipcode
       ,buildingno
       ,sido || ' ' || NVL(sigungu, ' ') || ' ' || NVL(eupmyun, ' ')
        ,doro
        ,DECODE(building2, '0',building1, building1 || '-' || building2)
        ,building
       
from postal
where building  like '%���б�%';

select zipcode
       ,buildingno
       ,sido || ' ' || NVL(sigungu, ' ') || ' ' || NVL(eupmyun, ' ') city
        ,doro || ' '|| DECODE(building2, '0',building1, building1 || '-' || building2) doro
        ,building
FROM postal
WHERE building LIKE '%ȫ�ͱ�%'
OR DORO || ' ' || building1 || building2 Like '%ȫ�ͱ� 8%';

ALTER TABLE CUSTOMER ADD(addr VARCHAR2(30)); 
ALTER TABLE CUSTOMER ADD(bulidingno VARCHAR2(25)); 

ALTER TABLE CUSTOMER
ADD CONSTRAINT customer_buildingno_fk FOREIGN KEY(bulidingno)
REFERENCES Postal(buildingno);

SELECT id, pwd, name, zipcode, p.building,sido || ' ' || NVL(sigungu, ' ') || ' ' || NVL(eupmyun, ' ') city,
doro || ' '|| DECODE(building2, '0',building1, building1 || '-' || building2) doro,building