drop table member cascade constraint;
drop table house cascade constraint;
drop table room cascade constraint;
drop table reservation cascade constraint;
drop table review cascade constraint;
drop table pay cascade constraint;
drop table qna cascade constraint;
drop table notice cascade constraint;

delete from qna where QA_num = 9
create table member
(	
	memberNo NUMBER(10) PRIMARY KEY NOT NULL,
	memberName VARCHAR2(200),
	memberId VARCHAR2(200) NOT NULL,	
	memberPass VARCHAR2(200),	
	memberEmail VARCHAR2(200) NOT NULL,
	memberGender CHAR(2) default 'm' NOT NULL,
	memberDel CHAR(1) default 'n' NOT NULL,
	reg_date DATE NOT NULL
)
alter table member modify memberPass varchar2(200);
create table house
(
	houseNo NUMBER PRIMARY KEY NOT NULL,
	houseName VARCHAR2(50) NOT NULL,
	houseLoc VARCHAR2(20) NOT NULL,
	houseTel VARCHAR2(50) NOT NULL,
	houseAddr VARCHAR2(100) NOT NULL,
	houseDel CHAR(1) default 'n' NOT NULL
)

create table room
(
	roomNo NUMBER PRIMARY KEY NOT NULL,
	houseNo NUMBER references house(houseNo) NOT NULL,
	roomName VARCHAR2(50) NOT NULL,
	roomType NUMBER NOT NULL,
	roomPrice NUMBER NOT NULL,
	roomCapa NUMBER NOT NULL,
	roomRemain NUMBER NOT NULL,
	roomDate DATE NOT NULL,
	roomDel CHAR(1) default 'n' NOT NULL
)
delete from room

create table pay
(
	payNo NUMBER PRIMARY KEY,
	houseNo NUMBER references house(houseNo),
	memberNo NUMBER references member(memberNo),
	payDate DATE,
	payType VARCHAR2(50),
	payDel CHAR(1) default 'n',	
	merchant_uid VARCHAR2(50),
	imp_uid VARCHAR2(50),
	method VARCHAR2(50),
	paySum NUMBER,	
	payState NUMBER default 0
)
select * from member;
create table reservation
(
	resNo NUMBER PRIMARY KEY NOT NULL,
	payNo references pay(payNo),
	roomNo references room(roomNo) NOT NULL,
	houseNo references house(houseNo) NOT NULL,
	memberNo references member(memberNo) NOT NULL,
	chkIn DATE NOT NULL,
	chkOut DATE NOT NULL,
	roomCount NUMBER NOT NULL
)

create table review
(
	reviewNo NUMBER PRIMARY KEY NOT NULL,
	payNo references pay(payNo) NOT NULL,
	houseNo references house(houseNo) NOT NULL,
	reviewSubject VARCHAR2(100) NOT NULL,
	reviewContent VARCHAR2(1000) NOT NULL,
	reviewScore NUMBER NOT NULL,
	reviewDate DATE NOT NULL,
	reviewDel CHAR(1) default 'n' NOT NULL
)
create table notice
(
	NT_num number(10) primary key NOT NULL,
	NT_title VARCHAR2(100) NOT NULL, 
	NT_regDate DATE NOT NULL, 
	NT_content VARCHAR2(1000) NOT NULL,
 	NT_del CHAR(1) default 'n' NOT NULL, 
 	memberNo number(10) NOT NULL references member(memberNo)
 )
 delete from room;
create table qna 
(
	QA_num number(10) primary key NOT NULL,
 	QA_title VARCHAR2(100) NOT NULL, 
 	QA_regDate DATE NOT NULL, 
 	QA_content VARCHAR2(1000) NOT NULL,
 	QA_fileName VARCHAR2(300) ,
 	QA_ref number(10) NOT NULL,
 	QA_refStep number(1) NOT NULL,
	QA_reflevel number(1) NOT NULL, 
	QA_del CHAR(1) default 'n' NOT NULL,
 	memberNo number NOT NULL references member(memberNo)
 );

create table parking
(
    pno number PRIMARY KEY,
    houseno Number references house(houseNo) NOT NULL,
    parkcontent VARCHAR2(100)
);
create table subway
(
    sno number PRIMARY KEY,
    houseno Number references house(houseNo) NOT NULL,
    subwaycontent VARCHAR2(100)
);
create table info
(
    ino number PRIMARY KEY,
    houseno Number references house(houseNo) NOT NULL,
    infocontent VARCHAR2(100)
);

CREATE SEQUENCE park_ex
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    nocache
    order;

CREATE SEQUENCE subway_ex
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    nocache
    order;

CREATE SEQUENCE info_ex
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    nocache
    order;

delete from room;
    
insert into member values (0, '관리자', 'admin', '11111111', 'k@naver.com', 'm', 'n', sysdate);
insert into member values (1, '숙소관리자', '1', '11111111', 'k1@naver.com', 'm', 'n', sysdate);
insert into member values (2, '숙소관리자', '2', '11111111', 'k2@naver.com', 'w', 'n', sysdate);
insert into member values (3, '숙소관리자', '3', '11111111', 'k3@naver.com', 'w', 'n', sysdate);
insert into member values (4, '숙소관리자', '4', '11111111', 'k4@naver.com', 'w', 'n', sysdate);
insert into member values (5, '숙소관리자', '5', '11111111', 'k5@naver.com', 'm', 'n', sysdate);
insert into member values (6, '숙소관리자', '6', '11111111', 'k6@naver.com', 'm', 'n', sysdate);
insert into member values (7, '숙소관리자', '7', '11111111', 'k7@naver.com', 'w', 'n', sysdate);
insert into member values (8, '숙소관리자', '8', '11111111', 'k8@naver.com', 'w', 'n', sysdate);
insert into member values (9, '숙소관리자', '9', '11111111', 'k9@naver.com', 'w', 'n', sysdate);
insert into member values (10, '숙소관리자', '10', '11111111', 'k10@naver.com', 'm', 'n', sysdate);
insert into member values (11, '숙소관리자', '11', '11111111', 'k11@naver.com', 'm', 'n', sysdate);
insert into member values (12, '숙소관리자', '12', '11111111', 'k12@naver.com', 'w', 'n', sysdate);
insert into member values (13, '숙소관리자', '13', '11111111', 'k13@naver.com', 'w', 'n', sysdate);
insert into member values (14, '숙소관리자', '14', '11111111', 'k14@naver.com', 'w', 'n', sysdate);
insert into member values (15, '숙소관리자', '15', '11111111', 'k15@naver.com', 'm', 'n', sysdate);
insert into member values (16, '숙소관리자', '16', '11111111', 'k16@naver.com', 'm', 'n', sysdate);
insert into member values (17, '숙소관리자', '17', '11111111', 'k17@naver.com', 'w', 'n', sysdate);
insert into member values (18, '숙소관리자', '18', '11111111', 'k18@naver.com', 'w', 'n', sysdate);
insert into member values (19, '숙소관리자', '19', '11111111', 'k19@naver.com', 'w', 'n', sysdate);
insert into member values (20, '숙소관리자', '20', '11111111', 'k20@naver.com', 'w', 'n', sysdate);




insert into house values (1, '또랑게스트하우스', '제주', '010-9282-2823', '제주 제주시 한북로 338', 'n');
insert into house values (2, '강릉 솔게스트하우스', '강원', '0507-1424-7325', '강원 강릉시 경포로463번길 36', 'n');
insert into house values (3, '한라산게스트하우스', '제주', '0507-1325-6198', '제주 제주시 제주대학로 77', 'n');
insert into house values (4, '숨게스트하우스 제주공항점', '제주', '0507-1311-0106', '제주 제주시 서광로5길 2-2', 'n');
insert into house values (5, '톡게스트하우스 전주점', '전주', '0507-1405-9477', '전북 전주시 완산구 풍남문4길 25-7', 'n');
insert into house values (6, 'ZIBRO S 게스트하우스', '서울', '0507-1304-6712', '서울 마포구 와우산로10길 14', 'n');
insert into house values (7, '여수낭만게스트하우스', '여수', '0507-1316-3982', '전남 여수시 교동시장2길 9', 'n');
insert into house values (8, '풍뎅이호스텔', '경주', '010-5570-0091', '경북 경주시 태종로699번길 14', 'n');
insert into house values (9, '첵앤아웃게스트하우스', '부산', '0507-1410-6523', '부산 중구 초량중로 8-1', 'n');
insert into house values (10, '앨리게스트하우스', '경주', '010-6211-1402', '경북 경주시 계림로106번길 12', 'n');
insert into house values (11, '쉼게스트하우스', '속초', '0507-1367-0366', '강원 속초시 중앙로 66', 'n');
insert into house values (12, '강릉게스트하우스 중앙점', '강릉', '0507-1357-7199', '강원 강릉시 경강로2103번길 17', 'n');
insert into house values (13, '하루 게스트하우스', '속초', '010-8407-6878', '강원 속초시 장안로 19-1', 'n');
insert into house values (14, '머문공간 게스트하우스', '제주', '010-8311-1137', '제주 서귀포시 성산읍 온평포구로54번길 61', 'n');
insert into house values (15, '1미리 게스트하우스', '제주', '1미리 게스트하우스', '제주 제주시 한림읍 협재6길 22-4', 'n');
insert into house values (16, '홍대 준 게스트하우스', '서울', '0507-1353-0325', '서울 마포구 와우산로29나길 24-3', 'n');
insert into house values (17, '달팽이의하루 게스트하우스', '전주', '0507-1307-4779', '전북 전주시 완산구 풍남문4길 26-6', 'n');
insert into house values (18, '소낭게스트하우스', '제주', '0507-1412-7676', '제주 제주시 구좌읍 월정1길 1', 'n');
insert into house values (19, '더짝게스트하우스', '단양', '0507-1405-6667', '충북 단양군 단양읍 수변로 123', 'n');
insert into house values (20, '더뷰게스트하우스', '부산', '0507-1434-5115', '부산 수영구 남천바다로33번길 47', 'n');





insert into pay values (1, 1, 1, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (2, 1, 2, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (3, 1, 3, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (4, 1, 4, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (5, 1, 1, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (6, 1, 2, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (7, 1, 3, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (8, 1, 4, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (9, 2, 1, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (10, 2, 2, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (11, 2, 3, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (12, 2, 4, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (13, 3, 1, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (14, 3, 2, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (15, 3, 3, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (16, 3, 4, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (17, 4, 1, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (18, 4, 2, sysdate, '카드', 'n', '0', '0', '0', 0, 0);
insert into pay values (19, 4, 3, sysdate, '카드', 'n', '0', '0', '0', 0, 0);

insert into reservation values (1, 1, 1, 1, 1, '2020-01-01', '2020-01-03', 1);
insert into reservation values (2, 2, 2, 1, 2, '2020-01-01', '2020-01-02', 1);
insert into reservation values (3, 3, 3, 1, 3, '2020-01-01', '2020-01-03', 1);
insert into reservation values (4, 4, 4, 1, 4, '2020-01-01', '2020-01-02', 1);
insert into reservation values (5, 5, 5, 1, 1, '2020-01-01', '2020-01-03', 1);
insert into reservation values (6, 6, 6, 1, 2, '2020-01-01', '2020-01-02', 1);
insert into reservation values (7, 7, 7, 1, 3, '2020-01-01', '2020-01-03', 1);
insert into reservation values (8, 8, 8, 1, 4, '2020-01-01', '2020-01-02', 1);
insert into reservation values (9, 9, 9, 2, 1, '2020-01-01', '2020-01-03', 1);
insert into reservation values (10, 10, 10, 2, 2, '2020-01-01', '2020-01-02', 1);
insert into reservation values (11, 11, 11, 2, 3, '2020-01-01', '2020-01-03', 1);
insert into reservation values (12, 12, 12, 2, 4, '2020-01-01', '2020-01-02', 1);
insert into reservation values (13, 13, 13, 3, 1, '2020-01-01', '2020-01-03', 1);
insert into reservation values (14, 14, 14, 3, 2, '2020-01-01', '2020-01-02', 1);
insert into reservation values (15, 15, 15, 3, 3, '2020-01-01', '2020-01-03', 1);
insert into reservation values (16, 16, 16, 3, 4, '2020-01-01', '2020-01-02', 1);
insert into reservation values (17, 17, 17, 4, 1, '2020-01-01', '2020-01-03', 1);
insert into reservation values (18, 18, 18, 4, 2, '2020-01-01', '2020-01-02', 1);
insert into reservation values (19, 19, 19, 4, 3, '2020-01-01', '2020-01-03', 1);

