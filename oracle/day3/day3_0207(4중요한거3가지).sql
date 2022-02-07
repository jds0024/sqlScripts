--**중요1 : 고객과 상품테이블의 행(row)데이터를 구분한 custom_ID,PCODE는 중복되면 안됨 
--			ㄴ기본키 컬럼을 정합니다.(중복된 값과 null은 허용이 안됩니다.)
--			ㄴ기본키는 테이블의 행(row)을 식별하는것이 목적입니다
--			ㄴselect를 기본키값으로 검색할 때 오직 0or1개의 행 결과과 조회됩니다
SELECT * FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID ='mina012';
--**중요2 :예를 들면 PRICE,QUANTITY등의 컬럼은 꼭 필수 데이터로 저장되어야 합니다.
--			ㄴ NOT NULL 컬럼으로 설정합니다.(Null저장 안됨)
--**중요3:고객과 상품 테이블에 없는 CUSTOM_ID ,PCODE 컬럼 값을 사용하면 부정확한 데이터
--					ㄴ외래키 컬럼을 정합니다.(다른테이블에서 값을 참조합니다.null허용도 안함)
--					ㄴ외래키는 컬럼의 데이터가 참조값(다른테이블의 컬럼값)을 사용하게 하는것이 목적입니다.
--위의 NOT NULL,기본키 ,외래키는 대표적인 제약조건(CONSTRAINT) 설정입니다.

CREATE TABLE tbl_custom#(
	custom_id varchar2(20) PRIMARY KEY,
	name nvarchar2  (20) NOT NULL ,	
	email varchar2 (20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
--상품 테이블 :상품코드(가변길이 20자리),카테코리(고정길이 2자리) 
--						A1:전자제품,B1:식품
CREATE TABLE tbl_product#(
	pcode varchar2 (20)CONSTRAINT pk_product PRIMARY KEY ,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL 
);

--구매 테이블 : 어느 고객이 무슨 상품을 구입하는가??
--구매테이블의 기본키는 별도로 컬럼을 추가합니다.

CREATE TABLE tbl_buy#(
	buy_seq number(8),   --구매정보 일련번호
	custom_id varchar2(20),
	pcode varchar2 (20),
	quantity number(5) NOT NULL,				--수량
	buy_date timestamp ,
	--constant키워드   제약조건 이름 제약조건 유형 (적용되는 컬럼)
	CONSTRAINT  pk_buy_seq PRIMARY Key(buy_seq),
	CONSTRAINT  fk_custom_id FOREIGN KEY (custom_id) -- 이테이블의 컬럼명
		REFERENCES tbl_custom#(custom_id),--참조 테이블과 그 컬럼명
	CONSTRAINT  fk_pcode FOREIGN key(pcode)
		REFERENCES tbl_product# (pcode)
		--외래키로 설정될 수 있는 컬럼은 기본키 또는 unique(유일한) 에 대해서만 가능합니다
		--왜래키 컬럼음 참조(reference)테이블의 컬럼값 중 하나로 저장할 수 있습니다
	);

--데이터의 추가:INSERT 
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '김미나', ',kimm@gamil.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '박모모', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '이나나', 'lee@naver.com', 40, sysdate);
--**중요1 : custom테이블의 행(row)데이터를 구분한 custom_ID,PCODE는 중복되면 안됨 
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '최모모', 'choi@naver.com', 40, sysdate);

INSERT INTO IDEV.TBl_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '아이패드', 880000);
INSERT INTO IDEV.TBl_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '동원참치선물세트', 54000);
INSERT INTO IDEV.TBl_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '모션데스크', 234500);
--**중요2 :예를 들면 PRICE,QUANTITY등의 컬럼은 꼭 필수 데이터로 저장되어야 합니다.
INSERT INTO IDEV.TB1_PRODUCT#(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '모션데스크');


--오라클에서는 일련번호를 자동으로 증가해서 상요하게 할수 있는 시퀀스기능이 있다
CREATE SEQUENCE tbl_buy_seq;
--한번 만들어져서 사용하던 시퀀스는 값을 되돌릴 수 없다

--시퀀스 새로 만들고싶다.삭제하고 다시 만드세요
DROP SEQUENCE tbl_buy_seq ;
-- 		테이블의 데이터도 삭제하세요. 그리고 다시 시퀀스 생성/데이터 추가하세요.

SELECT *FROM TBL_BUY# tb ;

--김미나가 아이패드 1개를 어제 구매
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
--홍길동이 아이패드 2개를 오늘 구매
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
--이나나가 참치선물세트 3개를 어제 구매
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
--김미나가 모션데스크 1개를 오늘 구매
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'dk_143', 1, '2022-02-07');

--박모모가 참치선물세트 2개를 오늘 구매 
INSERT  INTO IDEV.TBL_BUY# 
(Buy_SEQ,CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values (tbl_buy_seq.nextval,'twice','DOWON123a',2,'2022-02-07');
--**중요3:고객과 상품 테이블에 없는 CUSTOM_ID ,PCODE 컬럼 값을 사용하면 부정확한 데이터
--외래키로 설정된 custom_id는 tbl_custom# 테이블을 참조합니다.참조테이블의
--custom_id 컬럼값에 없는것을 저장할 수 없습니다.(외래키 위반,무결성 제약조건 위반)
INSERT  INTO IDEV.TBL_BUY# 
(Buy_SEQ,CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values (tbl_buy_seq.nextval,'min012','dk_143',2,'2022-02-07');
--외래키로 설정된 custom_id는 tbl_custom# 테이블을 참조합니다.참조테이블의
--custom_id 컬럼값에 없는것을 저장할 수 없습니다.(외래키 위반,무결성 제약조건 위반)
INSERT  INTO IDEV.TBL_BUY# 
(Buy_SEQ,CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values (tbl_buy_seq.nextval,'mina012','dk_14',2,'2022-02-07');

--custom# 테이블에서 age 가 30세 이상 모든 내용 조회
--2. custom# 테이블에서 custom_id 'twice' 의 email 조회
--3. product# 테이블에서 category 'A2' 의 pname 조회
--4. product# 테이블에서 price 의 최고값 조회
--5. buy# 테이블에서 'IPAD011' 총구매 수량 조회
--6. buy# 테이블에서 custom_id 'nayeon' 의 모든 내용 조회
--7. buy# 테이블에서 pcode 가 '1'이 포함된 것 조회
SELECT *FROM "TBL_BUY#" tb WHERE pcode='1'; --완전일치 조회
SELECT *FROM "TBL_BUY#" tb WHERE PCODE LIKE '%1%'; --부분일치 조회. 1을 포함
SELECT *FROM "TBL_BUY#" tb WHERE PCODE LIKE '1%'; --부분일치 조회. 1로 시작
SELECT *FROM "TBL_BUY#" tb WHERE PCODE LIKE '%1'; --부분일치 조회. 1로 끝나는
--8. buy# 테이블에서 pcode에 'on'을 포함하는 것 조회


