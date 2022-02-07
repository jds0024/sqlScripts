--**�߿�1 : ���� ��ǰ���̺��� ��(row)�����͸� ������ custom_ID,PCODE�� �ߺ��Ǹ� �ȵ� 
--			���⺻Ű �÷��� ���մϴ�.(�ߺ��� ���� null�� ����� �ȵ˴ϴ�.)
--			���⺻Ű�� ���̺��� ��(row)�� �ĺ��ϴ°��� �����Դϴ�
--			��select�� �⺻Ű������ �˻��� �� ���� 0or1���� �� ����� ��ȸ�˴ϴ�
SELECT * FROM "TBL_CUSTOM#" tc WHERE CUSTOM_ID ='mina012';
--**�߿�2 :���� ��� PRICE,QUANTITY���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
--			�� NOT NULL �÷����� �����մϴ�.(Null���� �ȵ�)
--**�߿�3:���� ��ǰ ���̺� ���� CUSTOM_ID ,PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
--					���ܷ�Ű �÷��� ���մϴ�.(�ٸ����̺��� ���� �����մϴ�.null��뵵 ����)
--					���ܷ�Ű�� �÷��� �����Ͱ� ������(�ٸ����̺��� �÷���)�� ����ϰ� �ϴ°��� �����Դϴ�.
--���� NOT NULL,�⺻Ű ,�ܷ�Ű�� ��ǥ���� ��������(CONSTRAINT) �����Դϴ�.

CREATE TABLE tbl_custom#(
	custom_id varchar2(20) PRIMARY KEY,
	name nvarchar2  (20) NOT NULL ,	
	email varchar2 (20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
--��ǰ ���̺� :��ǰ�ڵ�(�������� 20�ڸ�),ī���ڸ�(�������� 2�ڸ�) 
--						A1:������ǰ,B1:��ǰ
CREATE TABLE tbl_product#(
	pcode varchar2 (20)CONSTRAINT pk_product PRIMARY KEY ,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL 
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�??
--�������̺��� �⺻Ű�� ������ �÷��� �߰��մϴ�.

CREATE TABLE tbl_buy#(
	buy_seq number(8),   --�������� �Ϸù�ȣ
	custom_id varchar2(20),
	pcode varchar2 (20),
	quantity number(5) NOT NULL,				--����
	buy_date timestamp ,
	--constantŰ����   �������� �̸� �������� ���� (����Ǵ� �÷�)
	CONSTRAINT  pk_buy_seq PRIMARY Key(buy_seq),
	CONSTRAINT  fk_custom_id FOREIGN KEY (custom_id) -- �����̺��� �÷���
		REFERENCES tbl_custom#(custom_id),--���� ���̺�� �� �÷���
	CONSTRAINT  fk_pcode FOREIGN key(pcode)
		REFERENCES tbl_product# (pcode)
		--�ܷ�Ű�� ������ �� �ִ� �÷��� �⺻Ű �Ǵ� unique(������) �� ���ؼ��� �����մϴ�
		--�ַ�Ű �÷��� ����(reference)���̺��� �÷��� �� �ϳ��� ������ �� �ֽ��ϴ�
	);

--�������� �߰�:INSERT 
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', ',kimm@gamil.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate);
--**�߿�1 : custom���̺��� ��(row)�����͸� ������ custom_ID,PCODE�� �ߺ��Ǹ� �ȵ� 
INSERT INTO IDEV.TBL_CUSTOM#(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�ָ��', 'choi@naver.com', 40, sysdate);

INSERT INTO IDEV.TBl_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�', 880000);
INSERT INTO IDEV.TBl_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO IDEV.TBl_PRODUCT#(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);
--**�߿�2 :���� ��� PRICE,QUANTITY���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
INSERT INTO IDEV.TB1_PRODUCT#(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '��ǵ���ũ');


--����Ŭ������ �Ϸù�ȣ�� �ڵ����� �����ؼ� ����ϰ� �Ҽ� �ִ� ����������� �ִ�
CREATE SEQUENCE tbl_buy_seq;
--�ѹ� ��������� ����ϴ� �������� ���� �ǵ��� �� ����

--������ ���� �����ʹ�.�����ϰ� �ٽ� ���弼��
DROP SEQUENCE tbl_buy_seq ;
-- 		���̺��� �����͵� �����ϼ���. �׸��� �ٽ� ������ ����/������ �߰��ϼ���.

SELECT *FROM TBL_BUY# tb ;

--��̳��� �����е� 1���� ���� ����
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'IPAD011', 1, '2022-02-06');
--ȫ�浿�� �����е� 2���� ���� ����
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'hongGD', 'IPAD011', 2, '2022-02-07');
--�̳����� ��ġ������Ʈ 3���� ���� ����
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'wonder', 'DOWON123a', 3, '2022-02-06');
--��̳��� ��ǵ���ũ 1���� ���� ����
INSERT INTO IDEV.TBL_BUY#
(Buy_SEQ,CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES(tbl_buy_seq.nextval,'mina012', 'dk_143', 1, '2022-02-07');

--�ڸ�� ��ġ������Ʈ 2���� ���� ���� 
INSERT  INTO IDEV.TBL_BUY# 
(Buy_SEQ,CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values (tbl_buy_seq.nextval,'twice','DOWON123a',2,'2022-02-07');
--**�߿�3:���� ��ǰ ���̺� ���� CUSTOM_ID ,PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
--�ܷ�Ű�� ������ custom_id�� tbl_custom# ���̺��� �����մϴ�.�������̺���
--custom_id �÷����� ���°��� ������ �� �����ϴ�.(�ܷ�Ű ����,���Ἲ �������� ����)
INSERT  INTO IDEV.TBL_BUY# 
(Buy_SEQ,CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values (tbl_buy_seq.nextval,'min012','dk_143',2,'2022-02-07');
--�ܷ�Ű�� ������ custom_id�� tbl_custom# ���̺��� �����մϴ�.�������̺���
--custom_id �÷����� ���°��� ������ �� �����ϴ�.(�ܷ�Ű ����,���Ἲ �������� ����)
INSERT  INTO IDEV.TBL_BUY# 
(Buy_SEQ,CUSTOM_ID,PCODE,QUANTITY ,BUY_DATE)
values (tbl_buy_seq.nextval,'mina012','dk_14',2,'2022-02-07');

--custom# ���̺��� age �� 30�� �̻� ��� ���� ��ȸ
--2. custom# ���̺��� custom_id 'twice' �� email ��ȸ
--3. product# ���̺��� category 'A2' �� pname ��ȸ
--4. product# ���̺��� price �� �ְ� ��ȸ
--5. buy# ���̺��� 'IPAD011' �ѱ��� ���� ��ȸ
--6. buy# ���̺��� custom_id 'nayeon' �� ��� ���� ��ȸ
--7. buy# ���̺��� pcode �� '1'�� ���Ե� �� ��ȸ
SELECT *FROM "TBL_BUY#" tb WHERE pcode='1'; --������ġ ��ȸ
SELECT *FROM "TBL_BUY#" tb WHERE PCODE LIKE '%1%'; --�κ���ġ ��ȸ. 1�� ����
SELECT *FROM "TBL_BUY#" tb WHERE PCODE LIKE '1%'; --�κ���ġ ��ȸ. 1�� ����
SELECT *FROM "TBL_BUY#" tb WHERE PCODE LIKE '%1'; --�κ���ġ ��ȸ. 1�� ������
--8. buy# ���̺��� pcode�� 'on'�� �����ϴ� �� ��ȸ


