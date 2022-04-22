CREATE TABLE account(
    account_no CHAR(3) PRIMARY KEY
    ,account_balance NUMBER(8) DEFAULT 0
);

INSERT INTO account VALUES ('101', 1000);
INSERT INTO account VALUES ('202', 1000);
commit;

--계좌이체
    --1) 101번계좌에서 10원 출금 (0)
    --2) 901번 계좌에 10원 입금 (x)
UPDATE account set account_balance = account_balance - 10
WHERE account_no = '101'; -- (o)

UPDATE account set account_balance = account_balance + 10
WHERE account_no = '901'; -- (x)
ROLLBACK;

SELECT * FROM account;

----------------------------
-- SAVEPOINT 
INSERT INTO account VALUES ('301', 0);
SAVEPOINT B;
UPDATE account SET account_balance = 10 WHERE account_no = '301';
INSERT INTO account VALUES ('401', 100);
SAVEPOINT A;
DELETE account WHERE account_no = '401'; 
ROLLBACK to SAVEPOINT A;

SELECT * FROM account; -- 101,201,301,401모두 보임
                       -- 부분롤백확인
-- 트랜잭션 완료
commit;

-- DEAD LOCK 상태
DELETE FROM account WHERE account_no='401';
-- 트랜잭션완료
commit;