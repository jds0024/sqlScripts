-- 예시 :쇼핑몰 (고객이 상품을 구매 합니다)
--고객 테이블
CREATE TABLE tbl_custom(
	custom_id varchar2(20),	--영문/숫자/기호
	name nvarchar2  (20),	--한글등 다국어 문자 갯수
	email varchar2 (20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
--상품 테이블 :상품코드(가변길이 20자리),카테코리(고정길이 2자리) 
--						A1:전자제품,B1:식품
CREATE TABLE tb1_product(
	pcode varchar2 (20),
	category char(2),
	pname nvarchar2(20),
	price number(9)
);

--구매 테이블 : 어느 고객이 무슨 상품을 구입하는가??
CREATE TABLE tbl_buy(
	custom_id varchar2(20),
	pcode varchar2 (20),
	quantity number(5),				--수량
	buy_date timestamp 
	);

--데이터의 추가:INSERT 
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '김미나', ',kimm@gamil.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '박모모', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '이나나', 'lee@naver.com', 40, sysdate);
--**중요1 : custom테이블의 행(row)데이터를 구분한 custom_ID,PCODE는 중복되면 안됨 
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '최모모', 'choi@naver.com', 40, sysdate);

INSERT INTO IDEV.TB1_PRODUCT(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '아이패드', 880000);
INSERT INTO IDEV.TB1_PRODUCT(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '동원참치선물세트', 54000);
INSERT INTO IDEV.TB1_PRODUCT(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '모션데스크', 234500);
--**중요2 :예를 들면 PRICE,QUANTITY등의 컬럼은 꼭 필수 데이터로 저장되어야 합니다.
INSERT INTO IDEV.TB1_PRODUCT(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '모션데스크');




--김미나가 아이패드 1개를 어제 구매
INSERT INTO IDEV.TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'IPAD011', 1, '2022-02-06');
--홍길동이 아이패드 2개를 오늘 구매
INSERT INTO IDEV.TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('hongGD', 'IPAD011', 2, '2022-02-07');
--이나나가 참치선물세트 3개를 어제 구매
INSERT INTO IDEV.TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('wonder', 'DOWON123a', 3, '2022-02-06');
--김미나가 모션데스크 1개를 오늘 구매
INSERT INTO IDEV.TBL_BUY
(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'dk_143', 1, '2022-02-07');

--박모모가 참치선물세트 2개를 오늘 구매 
INSERT  INTO IDEV.TBL_BUY 
(CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values ('twice','DOWON123a',2,'2022-02-07');
--**중요3:고객과 상품 테이블에 없는 CUSTOM_ID ,PCODE 컬럼 값을 사용하면 무정확한 데이터
INSERT  INTO IDEV.TBL_BUY 
(CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values ('min012','d_143',2,'2022-02-07');



SELECT * FROM TBL_BUY tb ;
SELECT *FROM TBL_PRODUCT tp 
slelc





