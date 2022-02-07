--연습문제 작성자 정다산

--1.jobs 테이블 문제
	--1)min_salary 컬럼이 10000이상인 Job_title조회
		SELECT job_title FROM JOBS j WHERE MIN_SALARY >10000;
	--2)job_title 컬럼이 programmer 인 행의 모든 컬럼 조회
		SELECT *FROM JOBS j WHERE job_title ='Programmer';
			--대소문자 상관없이 한다면 문자열 관련 오라클 함수 :upper(),lower()
			SELECT *FROM  JOBS j WHERE UPPER(JOB_TITLE) ='PROGRAMMER';
			SELECT *FROM  JOBS j WHERE LOWER() (JOB_TITLE) ='programmer';
	--3)max_salary 필드값의 컬럼의 최대값 조회
		SELECT MAX(max_salary) FROM JOBS j ;
--미해결추가 :min_salary 의 평균값보다 작은 행의 job_id,job_title컬럼 조회->group진도 후 다시 해봄니다
			--SELECT job_id ,job_title  FROM JOBS j WHERE MIN_SALARY <AVG(MIN_SALARY) ;

--2) locations 테이블 문제
	--1)city 컬럼이 Lodon 인 postal_code 조회
		SELECT postal_code FROM LOCATIONS l WHERE CITY  ='London';
	--2)LOCATIONAL_ID컬럼이 1700,2700,2500이 아니고 city 컬럼이 Tokyo인 행의 모든 컬럼 조회
		SELECT *FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2700,2500)AND  CITY ='Tokyo';
	
--3)employees 테이블
	--통계함수(집계 함수)를 좀더 연습합니다.
SELECT count(*) FROM EMPLOYEES e; --총개수 :107
SELECT count(*) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG';--조건job_id직원수 :5

SELECT AVG(SALARY) FROM EMPLOYEES e ; --직원 평균 급여:6461.83
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--조건job_id평균급여:5760

SELECT MAX(salary) FROM EMPLOYEES e ;  --직원 중 최고 급여:24000
SELECT MAX(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG'; --조건job_id최고급여:9000

SELECT MIN(salary) FROM EMPLOYEES e ;--직원 중 최소 급여:2100
SELECT MIN(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG' ;--조건job_id최소급여:4200

--통계함수는 그룹함수입니다. 해당함수 결과값을 구하기위해 여러 데이터를 그룹화하고 실행합니다.
--그룹함수 결과와 다른 컬럼을 같이 조회할수 없습니다. 아래 sql은 오류입니다
	SELECT Job_id,MAX(salary) FROM EMPLOYEES e ;
	
	SELECT * FROM  EMPLOYEES e2 WHERE SALARY =(
	--위의 max,min 구한 sql 명령을 하나씩 여기에 넣어보세요.
	SELECT MIN(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG'
	);--select안에 쓰인 또 다른 select는 서브쿼리입니다.서브 쿼리 결과값이 1개 이므로 =조건식에 사용할수있습니다
	
	--IT_PROG 중에서 최소 급여를 받는 사람의 first_name,last_name컬럼 조회
	SELECT first_name ,last_name FROM EMPLOYEES e 
	WHERE SALARY =(SELECT MIN(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG' )
		AND JOB_ID ='IT_PROG';
	
	--위의 1번 문제에서 미해결된 sql 문을 완성해봆디ㅏ.
	--평균값
	--*그룹함수는 반드시 SELECT 문으로 사용합니다*
	SELECT AVG(MIN_SALARY)FROM JOBS j ; 
	
	SELECT job_id ,job_title  FROM JOBS j WHERE MIN_SALARY <(SELECT AVG(SALARY) FROM EMPLOYEES e ) ;

