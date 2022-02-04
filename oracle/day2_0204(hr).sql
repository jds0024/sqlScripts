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

	
