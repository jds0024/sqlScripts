--데이터 타입 number 연습 테이블
-- number:자바의 byte,short,int,long.float,double에 해당
--		  number(정밀도(전체자리수),소수점 자리수)
--table_number:테이블 이름
CREATE TABLE table_number(
	col1 NUMBER,		--자릿수를 지정햐ㅏ지 않으면 최대 38자리 입니다
	col2 number(5),
	col3 number(7,2),
	col4 number(2,5)
);
--정상실행
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.00012);
--col2칼럼의 자릿수가 6개:오류
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 123456, 12345.67, 0.00012);
--col3칼럼은 소수점 이하 지릿수를 2개:반올림
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.678, 0.00012);
--col3컬럼 전체 자릿수 7개:소수점 이하 항상 2개,그리고 나머지 정수부 5개->오류
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 123456.67, 0.00012);
--col4 컬럼은 number(2,5):전체 유효자릿수 5개
-- 			 이 때 항상 ~~~0이 아닌 유효자리수 최대 2개(0포함 가능) ,나머지 3개는 무조건 0
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.000126);
--col4 컬럼은 number(2,5):나머지 3개는 유효자릿수 0->이것이 아니면 오류
INSERT INTO IDEV.TABLE_NUMBER
(COL1, COL2, COL3, COL4)
VALUES(1234567, 12345, 12345.67, 0.0012);

