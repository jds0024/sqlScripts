--DML:select,insert,update,delete형식 알아보기

--데이터 조회:select 컬럼명1,컬럼명2...from 테이블
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM IDEV.STUDENTS;

	--선택되는 컬럼은 필요한 것들로 합니다.  명령어 한개 실행은 ctrl+enter
	SELECT stuno,stu_name from STUDENTS;

	--모든 컬럼을 선택할 때는 wildcard 문자 * 로 대체
	SELECT *FROM STUDENTS;

	--데이터 조회에 사용되는 조건 추가는 where 뒤에 조건식 작성
	SELECT * FROM STUDENTS WHERE STUNO =1;
	SELECT * FROM STUDENTS WHERE STU_NAME='최나나';
	SELECT * FROM STUDENTS WHERE ENTER_DATE >'2020-06-01'; --date타입은 문자열''기호 사용'

	--null값 데이터를 조회하는 조건식
	SELECT stuno,stu_name,enter_date,etc from STUDENTS WHERE etc IS NULL ;
	SELECT stuno,stu_name,enter_date,etc from STUDENTS WHERE etc IS NOT  NULL ;

	--데이터 조회 할때 컬럼명 대신에 함수(count,sum,avg,max,min)를 사용
	SELECT count(*) FROM STUDENTS;	--count는 행의 갯수를 구합니다
	SELECT MAX(stuno) FROM STUDENTS s;--s는 별칭(alias) 
	SELECT MIN(stuno) FROM STUDENTS s;--s는 별칭(alias) 
	
	SELECT MAX(stu_name) FROM STUDENTS s ; --문자열타입의 커럼은 사전식 비교하여 결과값 구함
	SELECT MIN(stu_name) FROM STUDENTS s ; 

	--데이터 조회 조건식에 IN,또는 NOT IN :or 조건식 대신에 사용
	SELECT  * FROM STUDENTS s WHERE STUNO =1 OR STUNO =3;
	SELECT  * FROM STUDENTS s WHERE STUNO in(1,3); --동일한 컬럼에 대해 여러개 값을 or조건 검사

--데이터 추가(삽입) :insert into 테이블명(컬럼명1,컬럼명2...) values(값1,값2,...)
INSERT INTO IDEV.STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');

--데이터수정:update 테이블병 set 컬럼명1=값1,컬럼명2=값2,....;
UPDATE IDEV.STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';

--데이터 행단위 삭제 :delete from 테이블명 where 컬럼명1=값1 and 컬럼명2=값2,...
DELETE FROM IDEV.STUDENTS					--WHERE 삭제할 행에 대한 조건
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

