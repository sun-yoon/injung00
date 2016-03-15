-- drop table
drop table member cascade constraints;
drop table board cascade constraints;
drop table board_comment cascade constraints;
drop table fileinfo cascade constraints;
drop table fri_list cascade constraints;
drop table likelist cascade constraints;
drop table option_kind cascade constraints;
drop table option_info cascade constraints;

-- drop secquence
drop sequence SEQ_mem_snum;
drop sequence SEQ_boa_snum;
drop sequence seq_com_snum;
drop sequence seq_fil_snum;
drop sequence seq_fri_snum;
drop sequence seq_lkl_snum;
drop sequence seq_opk_snum;
drop sequence seq_opt_snum;

--테이블, 시컨스 생성
--맴버
CREATE TABLE member
(
    mem_snum NUMBER PRIMARY KEY,
    mem_id VARCHAR2(100) NOT NULL,
    mem_passwd VARCHAR2(100) NOT NULL,
    mem_name VARCHAR2(100) NOT NULL,
    mem_email VARCHAR2(100) NOT NULL,
    mem_gender VARCHAR2(30) NOT NULL,
    mem_birth DATE DEFAULT SYSDATE NOT NULL,
    mem_profile VARCHAR2(200) NOT NULL,
    mem_isadmin varchar2(1) default 0 NOT NULL,
    mem_regdate DATE DEFAULT SYSDATE NOT NULL    
);
CREATE SEQUENCE SEQ_mem_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

create table board
(
    boa_snum NUMBER PRIMARY KEY,
    boa_subject VARCHAR2(100) NOT NULL,
    boa_context VARCHAR2(4000) NOT NULL,
    boa_regdate DATE DEFAULT SYSDATE NOT NULL,
    boa_injeong number default 0 not null,
    boa_hitCNT NUMBER NOT NULL,
    mem_snum number constraint FK_boa_mem references member(mem_snum)
);    
CREATE SEQUENCE SEQ_boa_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    

create table board_comment
(
    com_snum NUMBER PRIMARY KEY,
    com_context VARCHAR2(1000) NOT NULL,
    com_regdate DATE DEFAULT SYSDATE NOT NULL,
    boa_snum number constraint FK_com_boa references board(boa_snum),
    mem_snum number constraint FK_com_mem references member(mem_snum),
    com_par_snum number constraint FK_com_com references board_comment(com_snum)
);
CREATE SEQUENCE SEQ_COM_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    

create table fileinfo
(
    fil_snum NUMBER PRIMARY KEY,
    fil_path number ,
    boa_snum number constraint FK_fil_boa references board(boa_snum)
);
CREATE SEQUENCE SEQ_fil_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    

create table fri_list
(
    fri_snum NUMBER PRIMARY KEY,
    fri_level VARCHAR2(100) NOT NULL,    
    mem_snum number constraint FK_fri_mem references member(mem_snum),
    fri_mem_snum number constraint FK_fir_memfri references member(mem_snum)
);
CREATE SEQUENCE SEQ_fri_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    


create table likelist
(
    lkl_snum NUMBER PRIMARY KEY,
    lkl_regdate DATE DEFAULT SYSDATE NOT NULL,
    mem_snum number constraint FK_lkl_mem references member(mem_snum),
    boa_snum number constraint FK_lkl_boa references board(boa_snum)
);
CREATE SEQUENCE SEQ_lkl_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    

create table option_kind
(
    opk_snum NUMBER PRIMARY KEY,
    opk_name VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE SEQ_opk_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    


create table option_info
(
    opt_snum NUMBER PRIMARY KEY,
    opt_context VARCHAR2(100) NOT NULL,    
    mem_snum number constraint FK_opt_mem references member(mem_snum),
    opk_snum number constraint FK_opt_opk references option_kind(opk_snum)
);
CREATE SEQUENCE SEQ_opt_snum
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;    
