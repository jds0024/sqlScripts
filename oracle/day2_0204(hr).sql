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

	
