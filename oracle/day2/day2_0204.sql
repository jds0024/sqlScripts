--DML:select,insert,update,delete���� �˾ƺ���

--������ ��ȸ:select �÷���1,�÷���2...from ���̺�
SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC
FROM IDEV.STUDENTS;

	--���õǴ� �÷��� �ʿ��� �͵�� �մϴ�.  ��ɾ� �Ѱ� ������ ctrl+enter
	SELECT stuno,stu_name from STUDENTS;

	--��� �÷��� ������ ���� wildcard ���� * �� ��ü
	SELECT *FROM STUDENTS;

	--������ ��ȸ�� ���Ǵ� ���� �߰��� where �ڿ� ���ǽ� �ۼ�
	SELECT * FROM STUDENTS WHERE STUNO =1;
	SELECT * FROM STUDENTS WHERE STU_NAME='�ֳ���';
	SELECT * FROM STUDENTS WHERE ENTER_DATE >'2020-06-01'; --dateŸ���� ���ڿ�''��ȣ ���'

	--null�� �����͸� ��ȸ�ϴ� ���ǽ�
	SELECT stuno,stu_name,enter_date,etc from STUDENTS WHERE etc IS NULL ;
	SELECT stuno,stu_name,enter_date,etc from STUDENTS WHERE etc IS NOT  NULL ;

	--������ ��ȸ �Ҷ� �÷��� ��ſ� �Լ�(count,sum,avg,max,min)�� ���
	SELECT count(*) FROM STUDENTS;	--count�� ���� ������ ���մϴ�
	SELECT MAX(stuno) FROM STUDENTS s;--s�� ��Ī(alias) 
	SELECT MIN(stuno) FROM STUDENTS s;--s�� ��Ī(alias) 
	
	SELECT MAX(stu_name) FROM STUDENTS s ; --���ڿ�Ÿ���� Ŀ���� ������ ���Ͽ� ����� ����
	SELECT MIN(stu_name) FROM STUDENTS s ; 

	--������ ��ȸ ���ǽĿ� IN,�Ǵ� NOT IN :or ���ǽ� ��ſ� ���
	SELECT  * FROM STUDENTS s WHERE STUNO =1 OR STUNO =3;
	SELECT  * FROM STUDENTS s WHERE STUNO in(1,3); --������ �÷��� ���� ������ ���� or���� �˻�

--������ �߰�(����) :insert into ���̺��(�÷���1,�÷���2...) values(��1,��2,...)
INSERT INTO IDEV.STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATE, ETC)
VALUES(0, '', '', '', '', '');

--�����ͼ���:update ���̺� set �÷���1=��1,�÷���2=��2,....;
UPDATE IDEV.STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATE='', ETC='';

--������ ����� ���� :delete from ���̺�� where �÷���1=��1 and �÷���2=��2,...
DELETE FROM IDEV.STUDENTS					--WHERE ������ �࿡ ���� ����
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATE='' AND ETC='';

