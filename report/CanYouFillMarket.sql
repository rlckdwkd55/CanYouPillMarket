-- 회원 테이블
CREATE TABLE MEMBER(
    USERID VARCHAR2(30) CONSTRAINT PK_USER PRIMARY KEY,
    LEVELTYPE NUMBER DEFAULT 1 NOT NULL,
    CONSTRAINT FK_LEVELTYPE FOREIGN KEY(LEVELTYPE) 
    REFERENCES USERLEVEL(LEVELTYPE) ON DELETE CASCADE,
    PASSWORD VARCHAR2(100) NOT NULL,
    USERNAME VARCHAR2(30) NOT NULL,
    BIRTH DATE NOT NULL,
    GENDER CHAR(1) CHECK (GENDER IN ('F','M')) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL UNIQUE,
    PHONE VARCHAR2(14) NOT NULL,
    ADDRESS VARCHAR2(1000) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')) NOT NULL
);

-- 접근 등급 테이블
CREATE TABLE USERLEVEL(
    LEVELTYPE NUMBER PRIMARY KEY,
    LEVELNAME VARCHAR2(15)
);

-- 접근 등급 목록
INSERT INTO USERLEVEL VALUES (1, '일반회원');
INSERT INTO USERLEVEL VALUES (2, '관리자');

-- 카테고리 테이블
CREATE TABLE CATEGORY(
    CNO NUMBER PRIMARY KEY,
    CNAME VARCHAR2(30)
);

-- 카테고리 목록
INSERT INTO CATEGORY VALUES (1, '뼈/관절');
INSERT INTO CATEGORY VALUES (2, '면역력');
INSERT INTO CATEGORY VALUES (3, '소화/장');
INSERT INTO CATEGORY VALUES (4, '눈');
INSERT INTO CATEGORY VALUES (5, '모발');
-- INSERT INTO CATEGORY VALUES (6, '심장/혈관');

-- 상품 테이블
CREATE TABLE PRODUCT(
    PNO NUMBER PRIMARY KEY,
    CNO NUMBER CONSTRAINT FK_CNO REFERENCES CATEGORY(CNO) ON DELETE CASCADE,
    PNAME VARCHAR2(100) NOT NULL,
    PPRICE NUMBER NOT NULL,
    PINFO VARCHAR2(3000) NOT NULL,
    FPREC VARCHAR2(1000) NOT NULL,
    PENROLL DATE DEFAULT SYSDATE,
    PSTOCK NUMBER,
    PSELL NUMBER
);

-- PNO 시퀀스
CREATE SEQUENCE SEQ_PNO
MINVALUE 1
INCREMENT BY 1
START WITH 1
NOCACHE
NOCYCLE;

-- 상품 첨부파일 테이블
CREATE TABLE PATTACHMENT(
    PANO NUMBER CONSTRAINT PK_PANO PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_PATTACHMENT_PNO REFERENCES PRODUCT(PNO),
    ORIGINALNAME VARCHAR2(300) NOT NULL,
    CHANGENAME VARCHAR2(300) NOT NULL,
    UPLOADDATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1 BYTE) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

-- PANO 시퀀스
CREATE SEQUENCE SEQ_PANO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 리뷰 테이블
CREATE TABLE REVIEW (
    RENO NUMBER CONSTRAINT PK_RENO PRIMARY KEY,
    PNO NUMBER CONSTRAINT FK_PNO REFERENCES PRODUCT(PNO) ON DELETE CASCADE,
    REUSERID VARCHAR2(30) CONSTRAINT FK_REUSERID REFERENCES MEMBER(USERID) ON DELETE CASCADE,
    RETITLE VARCHAR2(500) NOT NULL,
    RECONTENT VARCHAR2(3000) NOT NULL,
    REUPLOADDATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1 BYTE) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

-- RENO 시퀀스
CREATE SEQUENCE SEQ_RENO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 리뷰 첨부파일 테이블 
CREATE TABLE RATTACHMENT(
    RANO NUMBER CONSTRAINT PK_RANO PRIMARY KEY,
    RENO NUMBER CONSTRAINT FK_REVIEW_RENO REFERENCES REVIEW(RENO),
    ORIGINALNAME VARCHAR2(300) NOT NULL,
    CHANGENAME VARCHAR2(300) NOT NULL,
    UPLOADDATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1 BYTE) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

-- RANO 시퀀스
CREATE SEQUENCE SEQ_RANO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 주문 테이블
CREATE TABLE ORDERED(
    ORDERNO NUMBER CONSTRAINT PK_ORDERNO PRIMARY KEY,
    ORDERUSERID VARCHAR2(30) CONSTRAINT FK_ORDER_ORDERUSERID REFERENCES MEMBER(USERID),
    PNO NUMBER CONSTRAINT FK_ORDER_PNO REFERENCES PRODUCT(PNO),
    TOTALPRICE NUMBER NOT NULL,
    ORDERENROLL DATE DEFAULT SYSDATE,
    ADDRESSEE VARCHAR2(30) NOT NULL,
    ADDRESS VARCHAR2(1000) NOT NULL,
    PHONE VARCHAR2(14) NOT NULL
);

-- ORDERNO 시퀀스
CREATE SEQUENCE SEQ_ORDERNO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 장바구니 테이블
CREATE TABLE CART(
    CARTNO NUMBER CONSTRAINT PK_CARTNO PRIMARY KEY,
    CARTUSERID VARCHAR2(30) CONSTRAINT FK_CART_CARTUSERID REFERENCES MEMBER(USERID),
    PNO NUMBER CONSTRAINT FK_CART_PNO REFERENCES PRODUCT(PNO),
    CART_Q NUMBER NOT NULL,
    CARTSTATUS VARCHAR2(1) DEFAULT 'Y' CHECK(CARTSTATUS IN('Y','N'))
);

-- CARTNO 시퀀스
CREATE SEQUENCE SEQ_CARTNO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 문의게시판 테이블
CREATE TABLE QNA(
    QANO NUMBER CONSTRAINT PK_QANO PRIMARY KEY,
    QAUSERID VARCHAR2(30) CONSTRAINT FK_QNA_QAUSERID REFERENCES MEMBER(USERID),
    QATITLE VARCHAR2(500) NOT NULL,
    QACONTENT VARCHAR2(3000) NOT NULL,
    QAUPLOADDATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1 BYTE) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

-- QANO 시퀀스
CREATE SEQUENCE SEQ_QANO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 문의답글 테이블
CREATE TABLE QNARe(
    RNO NUMBER CONSTRAINT PK_RNO PRIMARY KEY,
    QANO NUMBER CONSTRAINT FK_QNARe_QANO REFERENCES QNA(QANO),
    QAUSERID VARCHAR2(30) CONSTRAINT FK_QNARe_QAUSERID REFERENCES MEMBER(USERID),
    RTITLE VARCHAR2(500) NOT NULL,
    RCONTENT VARCHAR2(3000) NOT NULL,
    RDATE DATE DEFAULT SYSDATE
);

-- RNO 시퀀스
CREATE SEQUENCE SEQ_RNO
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

