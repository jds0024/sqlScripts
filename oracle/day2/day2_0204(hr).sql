--�������� �ۼ��� ���ٻ�

--1.jobs ���̺� ����
	--1)min_salary �÷��� 10000�̻��� Job_title��ȸ
		SELECT job_title FROM JOBS j WHERE MIN_SALARY >10000;
	--2)job_title �÷��� programmer �� ���� ��� �÷� ��ȸ
		SELECT *FROM JOBS j WHERE job_title ='Programmer';
			--��ҹ��� ������� �Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� :upper(),lower()
			SELECT *FROM  JOBS j WHERE UPPER(JOB_TITLE) ='PROGRAMMER';
			SELECT *FROM  JOBS j WHERE LOWER() (JOB_TITLE) ='programmer';
	--3)max_salary �ʵ尪�� �÷��� �ִ밪 ��ȸ
		SELECT MAX(max_salary) FROM JOBS j ;
--���ذ��߰� :min_salary �� ��հ����� ���� ���� job_id,job_title�÷� ��ȸ->group���� �� �ٽ� �غ��ϴ�
			--SELECT job_id ,job_title  FROM JOBS j WHERE MIN_SALARY <AVG(MIN_SALARY) ;

--2) locations ���̺� ����
	--1)city �÷��� Lodon �� postal_code ��ȸ
		SELECT postal_code FROM LOCATIONS l WHERE CITY  ='London';
	--2)LOCATIONAL_ID�÷��� 1700,2700,2500�� �ƴϰ� city �÷��� Tokyo�� ���� ��� �÷� ��ȸ
		SELECT *FROM LOCATIONS l WHERE LOCATION_ID NOT IN (1700,2700,2500)AND  CITY ='Tokyo';
	
--3)employees ���̺�
	--����Լ�(���� �Լ�)�� ���� �����մϴ�.
SELECT count(*) FROM EMPLOYEES e; --�Ѱ��� :107
SELECT count(*) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG';--����job_id������ :5

SELECT AVG(SALARY) FROM EMPLOYEES e ; --���� ��� �޿�:6461.83
SELECT AVG(SALARY) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG' ;--����job_id��ձ޿�:5760

SELECT MAX(salary) FROM EMPLOYEES e ;  --���� �� �ְ� �޿�:24000
SELECT MAX(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG'; --����job_id�ְ�޿�:9000

SELECT MIN(salary) FROM EMPLOYEES e ;--���� �� �ּ� �޿�:2100
SELECT MIN(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG' ;--����job_id�ּұ޿�:4200

--����Լ��� �׷��Լ��Դϴ�. �ش��Լ� ������� ���ϱ����� ���� �����͸� �׷�ȭ�ϰ� �����մϴ�.
--�׷��Լ� ����� �ٸ� �÷��� ���� ��ȸ�Ҽ� �����ϴ�. �Ʒ� sql�� �����Դϴ�
	SELECT Job_id,MAX(salary) FROM EMPLOYEES e ;
	
	SELECT * FROM  EMPLOYEES e2 WHERE SALARY =(
	--���� max,min ���� sql ����� �ϳ��� ���⿡ �־����.
	SELECT MIN(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG'
	);--select�ȿ� ���� �� �ٸ� select�� ���������Դϴ�.���� ���� ������� 1�� �̹Ƿ� =���ǽĿ� ����Ҽ��ֽ��ϴ�
	
	--IT_PROG �߿��� �ּ� �޿��� �޴� ����� first_name,last_name�÷� ��ȸ
	SELECT first_name ,last_name FROM EMPLOYEES e 
	WHERE SALARY =(SELECT MIN(salary) FROM EMPLOYEES e WHERE  JOB_ID ='IT_PROG' )
		AND JOB_ID ='IT_PROG';
	
	--���� 1�� �������� ���ذ�� sql ���� �ϼ��ؔG��.
	--��հ�
	--*�׷��Լ��� �ݵ�� SELECT ������ ����մϴ�*
	SELECT AVG(MIN_SALARY)FROM JOBS j ; 
	
	SELECT job_id ,job_title  FROM JOBS j WHERE MIN_SALARY <(SELECT AVG(SALARY) FROM EMPLOYEES e ) ;

