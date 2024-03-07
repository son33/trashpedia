DROP TABLE ATTACHMENT CASCADE CONSTRAINTS;
DROP TABLE BIG_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE BOARD_RECOMMEND CASCADE CONSTRAINTS;
DROP TABLE BOOKMARK CASCADE CONSTRAINTS;
DROP TABLE "COMMENT" CASCADE CONSTRAINTS;
DROP TABLE COMMENT_RECOMMEND CASCADE CONSTRAINTS;
DROP TABLE GRADE_RESTRICTION CASCADE CONSTRAINTS;
DROP TABLE HITS CASCADE CONSTRAINTS;
DROP TABLE IMG_ATTACHMENT CASCADE CONSTRAINTS;
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE MEMBER_SOCIAL CASCADE CONSTRAINTS;
DROP TABLE AUTHORITY CASCADE CONSTRAINTS;
DROP TABLE NESTED_COMMENT CASCADE CONSTRAINTS;
DROP TABLE PLEDGE CASCADE CONSTRAINTS;
DROP TABLE "POINT" CASCADE CONSTRAINTS;
DROP TABLE POINT_HISTORY CASCADE CONSTRAINTS;
DROP TABLE POST CASCADE CONSTRAINTS;
DROP TABLE REPORT CASCADE CONSTRAINTS;
DROP TABLE REQUEST CASCADE CONSTRAINTS;
DROP TABLE SIGNATURE CASCADE CONSTRAINTS;
DROP TABLE SUB_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE SUGGESTION CASCADE CONSTRAINTS;
DROP TABLE TRASH CASCADE CONSTRAINTS;
DROP TABLE TRASH_BIG_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE TRASH_HITS CASCADE CONSTRAINTS;
DROP TABLE TRASH_POST CASCADE CONSTRAINTS;
DROP TABLE TRASH_RECOMMEND CASCADE CONSTRAINTS;
DROP TABLE TRASH_SUB_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE USER_GRADE CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ATTNO;    
DROP SEQUENCE SEQ_BCNO;    
DROP SEQUENCE SEQ_BNO;   
DROP SEQUENCE SEQ_BMNO;    
DROP SEQUENCE SEQ_CNO;
DROP SEQUENCE SEQ_GRNO;
DROP SEQUENCE SEQ_HITNO;
DROP SEQUENCE SEQ_IATTNO;
DROP SEQUENCE SEQ_MNO;
DROP SEQUENCE SEQ_NCNO;
DROP SEQUENCE SEQ_PLENO;
DROP SEQUENCE SEQ_PHNO;
DROP SEQUENCE SEQ_POSTNO;
DROP SEQUENCE SEQ_RPNO;
DROP SEQUENCE SEQ_RQNO;
DROP SEQUENCE SEQ_RNO;
DROP SEQUENCE SEQ_SNO;
DROP SEQUENCE SEQ_SCNO;
DROP SEQUENCE SEQ_SUGNO;
DROP SEQUENCE SEQ_TNO;
DROP SEQUENCE SEQ_TBCNO;
DROP SEQUENCE SEQ_THNO;
DROP SEQUENCE SEQ_TPNO;
DROP SEQUENCE SEQ_TSCNO;
DROP SEQUENCE SEQ_UGNO;


CREATE TABLE "MEMBER" (
	"USER_NO" NUMBER NOT NULL PRIMARY KEY,
	"ROLE" VARCHAR2(30) DEFAULT 'USER' NOT NULL,
	"GRADE_NO" NUMBER DEFAULT 2 NOT NULL,
	"USER_EMAIL" VARCHAR2(50) NOT NULL,
	"USER_PWD" VARCHAR2(200) NOT NULL,
	"USER_NAME" VARCHAR2(60) NOT NULL,
	"USER_NICKNAME" VARCHAR2(24) NULL,
	"PHONE" VARCHAR2(13) NULL,
	"ZIPCODE" NUMBER NULL,
	"ADDRESS1" VARCHAR2(300) NULL,
	"ADDRESS2" VARCHAR2(300) NULL,
	"ADDRESS3" VARCHAR2(300) NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "MEMBER"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "MEMBER"."ROLE" IS 'ADMIN, MANAGER, USER';
COMMENT ON COLUMN "MEMBER"."GRADE_NO" IS '회원 등급';
COMMENT ON COLUMN "MEMBER"."USER_EMAIL" IS '이메일 = ID';
COMMENT ON COLUMN "MEMBER"."USER_PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."USER_NAME" IS '실명';
COMMENT ON COLUMN "MEMBER"."USER_NICKNAME" IS '미입력 시 게시글 작성, 댓글 작성 권한 없음';
COMMENT ON COLUMN "MEMBER"."PHONE" IS '- 포함';
COMMENT ON COLUMN "MEMBER"."ZIPCODE" IS '우편번호';
COMMENT ON COLUMN "MEMBER"."ADDRESS1" IS '주소 입력하지 않아도 되나 미 입력 시 위치기반 서비스 불가';
COMMENT ON COLUMN "MEMBER"."ADDRESS2" IS '주소';
COMMENT ON COLUMN "MEMBER"."ADDRESS3" IS '상세주소';
COMMENT ON COLUMN "MEMBER"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "MEMBER"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "MEMBER"."STATUS" IS '회원 탈퇴 휴면 여부';

CREATE TABLE MEMBER_SOCIAL(
    SOCIAL_ID VARCHAR2(50 BYTE) NOT NULL,
    USER_NO NUMBER REFERENCES MEMBER NOT NULL,
    SOCIAL_TYPE VARCHAR2(50 BYTE) NOT NULL
);

COMMENT ON COLUMN "MEMBER_SOCIAL"."SOCIAL_ID" IS '소셜 아이디 번호';
COMMENT ON COLUMN "MEMBER_SOCIAL"."USER_NO" IS '유저번호';
COMMENT ON COLUMN "MEMBER_SOCIAL"."SOCIAL_TYPE" IS '소셜 타입';

CREATE TABLE AUTHORITY (
    USER_NO NUMBER NOT NULL,
    AUTHORITY VARCHAR2(20) NOT NULL ,
    PRIMARY KEY(USER_NO , AUTHORITY),
    FOREIGN KEY(USER_NO) REFERENCES MEMBER
);

COMMENT ON COLUMN "AUTHORITY"."USER_NO" IS '유저번호';
COMMENT ON COLUMN "AUTHORITY"."AUTHORITY" IS '권한';

CREATE TABLE "BOARD" (
	"BOARD_NO" NUMBER NOT NULL PRIMARY KEY,
	"POST_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"SUB_CATEGORY_NO" NUMBER NOT NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시판번호';
COMMENT ON COLUMN "BOARD"."POST_NO" IS '글내용번호';
COMMENT ON COLUMN "BOARD"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "BOARD"."SUB_CATEGORY_NO" IS '소뷴류 카테고리 번호';
COMMENT ON COLUMN "BOARD"."STATUS" IS '게시글 상태';

CREATE TABLE "POST" (
	"POST_NO" NUMBER NOT NULL PRIMARY KEY,
	"TITLE" VARCHAR2(100) NOT NULL,
	"CONTENT" CLOB NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "POST"."POST_NO" IS '글내용번호';
COMMENT ON COLUMN "POST"."TITLE" IS '제목';
COMMENT ON COLUMN "POST"."CONTENT" IS '내용';
COMMENT ON COLUMN "POST"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "POST"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "POST"."STATUS" IS '글내용 상태';

CREATE TABLE "BIG_CATEGORY" (
	"BIG_CATEGORY_NO" NUMBER NOT NULL PRIMARY KEY,
	"BIG_CATEGORY_NAME" VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "BIG_CATEGORY"."BIG_CATEGORY_NO" IS '대분류 카테고리 번호';
COMMENT ON COLUMN "BIG_CATEGORY"."BIG_CATEGORY_NAME" IS '대분류 카테고리 이름';

CREATE TABLE "SUB_CATEGORY" (
	"SUB_CATEGORY_NO" NUMBER NOT NULL PRIMARY KEY,
	"BIG_CATEGORY_NO" NUMBER NOT NULL,
	"SUB_CATEGORY_NAME" VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "SUB_CATEGORY"."SUB_CATEGORY_NO" IS '소분류 카테고리 번호';
COMMENT ON COLUMN "SUB_CATEGORY"."BIG_CATEGORY_NO" IS '대분류 카테고리 번호';
COMMENT ON COLUMN "SUB_CATEGORY"."SUB_CATEGORY_NAME" IS '소분류 카테고리 이름';

CREATE TABLE "ATTACHMENT" (
	"FILE_NO" NUMBER NOT NULL PRIMARY KEY,
	"REF_BNO" NUMBER NOT NULL,
	"ORIGIN_NAME" VARCHAR2(300) NOT NULL,
	"CHANGE_NAME" VARCHAR2(300) NOT NULL,
	"FILE_TYPE" NUMBER NOT NULL,
	"CREATE_DATE" DATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "ATTACHMENT"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "ATTACHMENT"."REF_BNO" IS '게시판 번호';
COMMENT ON COLUMN "ATTACHMENT"."ORIGIN_NAME" IS '파일 원본 명';
COMMENT ON COLUMN "ATTACHMENT"."CHANGE_NAME" IS '파일 수정 명';
COMMENT ON COLUMN "ATTACHMENT"."FILE_TYPE" IS '1. 게시판,2.쓰레기,3. ...';
COMMENT ON COLUMN "ATTACHMENT"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "ATTACHMENT"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "ATTACHMENT"."STATUS" IS '첨부파일 상태';

CREATE TABLE "IMG_ATTACHMENT" (
	"IMG_NO" NUMBER NOT NULL PRIMARY KEY,
	"REF_BNO" NUMBER NOT NULL,
	"ORIGIN_NAME" VARCHAR2(300) NOT NULL,
	"CHANGE_NAME" VARCHAR2(300) NOT NULL,
	"IMG_LEVEL" NUMBER NOT NULL,
	"IMG_TYPE" NUMBER NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "IMG_ATTACHMENT"."IMG_NO" IS '이미지 번호';
COMMENT ON COLUMN "IMG_ATTACHMENT"."REF_BNO" IS '게시판 번호, 쓰레기 번호';
COMMENT ON COLUMN "IMG_ATTACHMENT"."ORIGIN_NAME" IS '이미지 원본 명';
COMMENT ON COLUMN "IMG_ATTACHMENT"."CHANGE_NAME" IS '이미지 수정 명';
COMMENT ON COLUMN "IMG_ATTACHMENT"."IMG_LEVEL" IS '이미지 종류 1. 썸네일 2. 게시글';
COMMENT ON COLUMN "IMG_ATTACHMENT"."IMG_TYPE" IS '1. 게시판 2. 쓰레기 3. ...';
COMMENT ON COLUMN "IMG_ATTACHMENT"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "IMG_ATTACHMENT"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "IMG_ATTACHMENT"."STATUS" IS '이미지 상태';

CREATE TABLE "COMMENT" (
	"COMMENT_NO" NUMBER NOT NULL PRIMARY KEY,
	"BOARD_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"CONTENT" VARCHAR2(2000) NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글번호';
COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '참조 게시판번호';
COMMENT ON COLUMN "COMMENT"."USER_NO" IS '작성자';
COMMENT ON COLUMN "COMMENT"."CONTENT" IS '내용';
COMMENT ON COLUMN "COMMENT"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "COMMENT"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "COMMENT"."STATUS" IS '댓글 상태';

CREATE TABLE "BOARD_RECOMMEND" (
	"BOARD_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"LIKE" VARCHAR2(1) DEFAULT 'Y' NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL
);

COMMENT ON COLUMN "BOARD_RECOMMEND"."BOARD_NO" IS '게시판번호';
COMMENT ON COLUMN "BOARD_RECOMMEND"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "BOARD_RECOMMEND"."LIKE" IS '좋아요 여부';
COMMENT ON COLUMN "BOARD_RECOMMEND"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "BOARD_RECOMMEND"."MODIFY_DATE" IS '수정일';

CREATE TABLE "NESTED_COMMENT" (
	"NESTED_COMMENT_NO"	NUMBER NOT NULL PRIMARY KEY,
	"COMMENT_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"CONTENT" VARCHAR2(2000) NOT NULL,
	"CREATE_DATE" DATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "NESTED_COMMENT"."NESTED_COMMENT_NO" IS '대댓글번호';
COMMENT ON COLUMN "NESTED_COMMENT"."COMMENT_NO" IS '참조댓글번호';
COMMENT ON COLUMN "NESTED_COMMENT"."USER_NO" IS '작성자';
COMMENT ON COLUMN "NESTED_COMMENT"."CONTENT" IS '내용';
COMMENT ON COLUMN "NESTED_COMMENT"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "NESTED_COMMENT"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "NESTED_COMMENT"."STATUS" IS '대댓글 상태';

CREATE TABLE "COMMENT_RECOMMEND" (
	"COMMENT_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"LIKE" VARCHAR2(1) DEFAULT 'Y' NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL
);

COMMENT ON COLUMN "COMMENT_RECOMMEND"."COMMENT_NO" IS '댓글번호';
COMMENT ON COLUMN "COMMENT_RECOMMEND"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "COMMENT_RECOMMEND"."LIKE" IS '좋아요 여부';
COMMENT ON COLUMN "COMMENT_RECOMMEND"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "COMMENT_RECOMMEND"."MODIFY_DATE" IS '수정일';

CREATE TABLE "BOOKMARK" (
	"USER_NO" NUMBER NOT NULL,
	"BOARD_NO" NUMBER NOT NULL,
	"BOOKMARK" VARCHAR2(1) DEFAULT 'Y' NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL
);

COMMENT ON COLUMN "BOOKMARK"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "BOOKMARK"."BOARD_NO" IS '게시판번호';
COMMENT ON COLUMN "BOOKMARK"."BOOKMARK" IS '북마크 여부';
COMMENT ON COLUMN "BOOKMARK"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "BOOKMARK"."MODIFY_DATE" IS '수정일';

CREATE TABLE "USER_GRADE" (
	"GRADE_NO" NUMBER NOT NULL PRIMARY KEY,
	"GRADE_NAME" VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "USER_GRADE"."GRADE_NAME" IS '1.관리자, 2.씨앗, 3.새싹, 4.줄기, 5.나무, 6.열매, 7.숲';

CREATE TABLE "REPORT" (
	"REPORT_NO" NUMBER NOT NULL PRIMARY KEY,
	"USER_NO" NUMBER NOT NULL,
	"REPORT_CONTENT" VARCHAR2(1000) NOT NULL,
	"REPORT_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"REPORT_TYPE" NUMBER NOT NULL,
	"REPORT_TARGET_NO" NUMBER NOT NULL,
	"PROCESSING_CONTENT" VARCHAR2(1000) NULL,
	"PROCESSING_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';
COMMENT ON COLUMN "REPORT"."USER_NO" IS '신고한회원번호';
COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';
COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고일';
COMMENT ON COLUMN "REPORT"."REPORT_TYPE" IS '1이면 게시글 2이면 댓글 3이면 대댓글';
COMMENT ON COLUMN "REPORT"."REPORT_TARGET_NO" IS '게시글 번호 OR 댓글 번호';
COMMENT ON COLUMN "REPORT"."PROCESSING_CONTENT" IS '처리내용';
COMMENT ON COLUMN "REPORT"."PROCESSING_DATE" IS '처리일';
COMMENT ON COLUMN "REPORT"."STATUS" IS '신고상태';

CREATE TABLE "TRASH" (
	"TRASH_NO" NUMBER NOT NULL PRIMARY KEY,
	"TRASH_POST_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"SUB_CATEGORY_NO" NUMBER NOT NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NULL
);

COMMENT ON COLUMN "TRASH"."TRASH_NO" IS '쓰레기번호';
COMMENT ON COLUMN "TRASH"."TRASH_POST_NO" IS '내용번호';
COMMENT ON COLUMN "TRASH"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "TRASH"."SUB_CATEGORY_NO" IS '소분류 카테고리 번호';
COMMENT ON COLUMN "TRASH"."STATUS" IS '쓰레기 상태';

CREATE TABLE "TRASH_RECOMMEND" (
	"TRASH_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"LIKE" VARCHAR2(1) DEFAULT 'Y' NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL
);

COMMENT ON COLUMN "TRASH_RECOMMEND"."TRASH_NO" IS '쓰레기번호';
COMMENT ON COLUMN "TRASH_RECOMMEND"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "TRASH_RECOMMEND"."LIKE" IS '좋아요 여부';
COMMENT ON COLUMN "TRASH_RECOMMEND"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "TRASH_RECOMMEND"."MODIFY_DATE" IS '수정일';

CREATE TABLE "TRASH_BIG_CATEGORY" (
	"BIG_CATEGORY_NO" NUMBER NOT NULL PRIMARY KEY,
	"BIG_CATEGORY_NAME" VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "TRASH_BIG_CATEGORY"."BIG_CATEGORY_NO" IS '대분류 카테고리 번호';
COMMENT ON COLUMN "TRASH_BIG_CATEGORY"."BIG_CATEGORY_NAME" IS '대분류 카테고리 이름';

CREATE TABLE "TRASH_SUB_CATEGORY" (
	"SUB_CATEGORY_NO" NUMBER NOT NULL PRIMARY KEY,
	"BIG_CATEGORY_NO" NUMBER NOT NULL,
	"SUB_CATEGORY_NAME" VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "TRASH_SUB_CATEGORY"."SUB_CATEGORY_NO" IS '소분류 카테고리 번호';
COMMENT ON COLUMN "TRASH_SUB_CATEGORY"."BIG_CATEGORY_NO" IS '대분류 카테고리 번호';
COMMENT ON COLUMN "TRASH_SUB_CATEGORY"."SUB_CATEGORY_NAME" IS '소분류 카테고리 이름';

CREATE TABLE "TRASH_POST" (
	"TRASH_POST_NO" NUMBER NOT NULL PRIMARY KEY,
	"TRASH_TITLE" VARCHAR2(100) NOT NULL,
	"TRASH_INFO" CLOB NOT NULL,
    "TRASH_EXTRAINFO" CLOB NOT NULL,
	"CREATE_DATE" DATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "TRASH_POST"."TRASH_POST_NO" IS '쓰레기 번호';
COMMENT ON COLUMN "TRASH_POST"."TRASH_TITLE" IS '이름';
COMMENT ON COLUMN "TRASH_POST"."TRASH_INFO" IS '쓰레기정보';
COMMENT ON COLUMN "TRASH_POST"."TRASH_EXTRAINFO" IS '추가정보';
COMMENT ON COLUMN "TRASH_POST"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "TRASH_POST"."MODIFY_DATE" IS '수정일';
COMMENT ON COLUMN "TRASH_POST"."STATUS" IS '쓰레기 상태';

CREATE TABLE "REQUEST" (
	"REQUEST_NO" NUMBER NOT NULL PRIMARY KEY,
	"TRASH_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"REQUEST_TITLE" VARCHAR2(100) NOT NULL,
	"REQUEST_CONTENT" VARCHAR2(1000) NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"PROCESSING_STATUS" VARCHAR2(1) DEFAULT 'N' NOT NULL,
	"PROCESSING_CONTENT" VARCHAR2(1000) NULL,
	"PROCESSING_DATE" DATE NULL
);

COMMENT ON COLUMN "REQUEST"."REQUEST_NO" IS '수정요청번호';
COMMENT ON COLUMN "REQUEST"."TRASH_NO" IS '쓰레기번호';
COMMENT ON COLUMN "REQUEST"."USER_NO" IS '작성자';
COMMENT ON COLUMN "REQUEST"."REQUEST_TITLE" IS '제목';
COMMENT ON COLUMN "REQUEST"."REQUEST_CONTENT" IS '내용';
COMMENT ON COLUMN "REQUEST"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "REQUEST"."PROCESSING_STATUS" IS '처리상태';
COMMENT ON COLUMN "REQUEST"."PROCESSING_CONTENT" IS '처리내용';
COMMENT ON COLUMN "REQUEST"."PROCESSING_DATE" IS '처리일';

CREATE TABLE "HITS" (
	"HITS_NO" NUMBER NOT NULL PRIMARY KEY,
	"BOARD_NO" NUMBER NOT NULL,
	"USER_NO" NUMBER NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "HITS"."HITS_NO" IS '조회번호';
COMMENT ON COLUMN "HITS"."BOARD_NO" IS '조회한게시판번호';
COMMENT ON COLUMN "HITS"."USER_NO" IS '조회자';
COMMENT ON COLUMN "HITS"."CREATE_DATE" IS '조회일 기준 24시간 지날 시 새로운 조회 추가';

CREATE TABLE "GRADE_RESTRICTION" (
	"RESTRICTION_NO" NUMBER NOT NULL PRIMARY KEY,
	"USER_NO" NUMBER NOT NULL,
	"RESTRICTION_CONTENT" VARCHAR2(1000) NOT NULL,
	"RESTRICTION_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"RESTRICTION_RELEASE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "GRADE_RESTRICTION"."RESTRICTION_NO" IS '권한제한번호';
COMMENT ON COLUMN "GRADE_RESTRICTION"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "GRADE_RESTRICTION"."RESTRICTION_CONTENT" IS '제한내용';
COMMENT ON COLUMN "GRADE_RESTRICTION"."RESTRICTION_DATE" IS '제한일';
COMMENT ON COLUMN "GRADE_RESTRICTION"."RESTRICTION_RELEASE_DATE" IS '제한해제일';
COMMENT ON COLUMN "GRADE_RESTRICTION"."STATUS" IS '권한제한상태 (제한해제일이 되면 자동으로 N으로 변경)';

CREATE TABLE "TRASH_HITS" (
	"HITS_NO" NUMBER NOT NULL PRIMARY KEY,
	"USER_NO" NUMBER NOT NULL,
	"TRASH_NO" NUMBER NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "TRASH_HITS"."HITS_NO" IS '조회번호';
COMMENT ON COLUMN "TRASH_HITS"."USER_NO" IS '조회자';
COMMENT ON COLUMN "TRASH_HITS"."TRASH_NO" IS '쓰레기 번호';
COMMENT ON COLUMN "TRASH_HITS"."CREATE_DATE" IS '조회일 기준 24시간 지날 시 새로운 조회 추가';

CREATE TABLE "POINT" (
	"USER_NO" NUMBER NOT NULL,
	"POINT" NUMBER DEFAULT 0 NOT NULL
);

COMMENT ON COLUMN "POINT"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "POINT"."POINT" IS '현재포인트';

CREATE TABLE "POINT_HISTORY" (
	"POINT_NO" NUMBER NOT NULL PRIMARY KEY,
	"USER_NO" NUMBER NOT NULL,
	"POINT_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"AMOUNT" NUMBER NOT NULL,
	"POINT_CONTENT" VARCHAR2(300) NOT NULL
);

COMMENT ON COLUMN "POINT_HISTORY"."POINT_NO" IS '포인트내역번호';
COMMENT ON COLUMN "POINT_HISTORY"."USER_NO" IS '회원번호';
COMMENT ON COLUMN "POINT_HISTORY"."POINT_DATE" IS '적립일, 사용일';
COMMENT ON COLUMN "POINT_HISTORY"."AMOUNT" IS '적립, 사용 포인트';
COMMENT ON COLUMN "POINT_HISTORY"."POINT_CONTENT" IS '적립, 사용 내용';

CREATE TABLE "SUGGESTION" (
	"SUGGESTION_NO" NUMBER NOT NULL PRIMARY KEY,
	"USER_NO" NUMBER NOT NULL,
	"SUGGESTION_TITLE" VARCHAR2(100) NOT NULL,
	"SUGGESTION_CONTENT" VARCHAR2(1000) NOT NULL,
	"CREATE_DATE" DATE	DEFAULT SYSDATE NOT NULL,
	"PROCESSING_STATUS" VARCHAR2(1) DEFAULT 'N' NOT NULL,
	"PROCESSING_CONTENT" VARCHAR2(1000) NULL,
	"PROCESSING_DATE" DATE NULL
);

COMMENT ON COLUMN "SUGGESTION"."SUGGESTION_NO" IS '건의요청번호';
COMMENT ON COLUMN "SUGGESTION"."USER_NO" IS '작성자';
COMMENT ON COLUMN "SUGGESTION"."SUGGESTION_TITLE" IS '제목';
COMMENT ON COLUMN "SUGGESTION"."SUGGESTION_CONTENT" IS '내용';
COMMENT ON COLUMN "SUGGESTION"."CREATE_DATE" IS '생성일';
COMMENT ON COLUMN "SUGGESTION"."PROCESSING_STATUS" IS '처리상태';
COMMENT ON COLUMN "SUGGESTION"."PROCESSING_CONTENT" IS '처리내용';
COMMENT ON COLUMN "SUGGESTION"."PROCESSING_DATE" IS '처리일';

CREATE TABLE "PLEDGE" (
	"PLEDGE_NO" NUMBER NOT NULL PRIMARY KEY,
	"IMG_NO" NUMBER NOT NULL,
	"TITLE" VARCHAR2(300) NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE NULL,
	"STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN "PLEDGE"."PLEDGE_NO" IS '서약번호';
COMMENT ON COLUMN "PLEDGE"."IMG_NO" IS '이미지번호';
COMMENT ON COLUMN "PLEDGE"."TITLE" IS '제목';
COMMENT ON COLUMN "PLEDGE"."CREATE_DATE" IS '게시글 작성일';
COMMENT ON COLUMN "PLEDGE"."MODIFY_DATE" IS '게시글 수정일';
COMMENT ON COLUMN "PLEDGE"."STATUS" IS '게시글 상태';

CREATE TABLE "SIGNATURE" (
	"SIGNATURE_NO" NUMBER NOT NULL PRIMARY KEY,
	"USER_NO" NUMBER NOT NULL,
	"PLEDGE_NO" NUMBER NOT NULL,
	"SIGNATURE_STATUS" VARCHAR2(1) DEFAULT 'Y' NOT NULL,
	"CREATE_DATE" DATE NOT NULL,
	"MODIFY_DATE" DATE NULL
);

COMMENT ON COLUMN "SIGNATURE"."SIGNATURE_NO" IS '서명번호';
COMMENT ON COLUMN "SIGNATURE"."USER_NO" IS '서약자';
COMMENT ON COLUMN "SIGNATURE"."PLEDGE_NO" IS '참조서약번호';
COMMENT ON COLUMN "SIGNATURE"."SIGNATURE_STATUS" IS '서약상태';
COMMENT ON COLUMN "SIGNATURE"."CREATE_DATE" IS '서약일';
COMMENT ON COLUMN "SIGNATURE"."MODIFY_DATE" IS '수정일';

ALTER TABLE BOARD ADD CONSTRAINT FK_B_REF_POST_NO FOREIGN KEY(POST_NO) REFERENCES POST(POST_NO);
ALTER TABLE BOARD ADD CONSTRAINT FK_B_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);
ALTER TABLE BOARD ADD CONSTRAINT FK_B_REF_SUB_CATEGORY_NO FOREIGN KEY(SUB_CATEGORY_NO) REFERENCES SUB_CATEGORY(SUB_CATEGORY_NO);

ALTER TABLE BOARD_RECOMMEND ADD CONSTRAINT FK_BR_REF_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO);
ALTER TABLE BOARD_RECOMMEND ADD CONSTRAINT FK_BR_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE BOOKMARK ADD CONSTRAINT FK_BM_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);
ALTER TABLE BOOKMARK ADD CONSTRAINT FK_BM_REF_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO);

ALTER TABLE "COMMENT" ADD CONSTRAINT FK_C_REF_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO);
ALTER TABLE "COMMENT" ADD CONSTRAINT FK_C_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE COMMENT_RECOMMEND ADD CONSTRAINT FK_CM_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE GRADE_RESTRICTION ADD CONSTRAINT FK_GR_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE HITS ADD CONSTRAINT FK_H_REF_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO);
ALTER TABLE HITS ADD CONSTRAINT FK_H_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE MEMBER ADD CONSTRAINT FK_M_REF_GRADE_NO FOREIGN KEY(GRADE_NO) REFERENCES USER_GRADE(GRADE_NO);

ALTER TABLE NESTED_COMMENT ADD CONSTRAINT FK_NC_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE PLEDGE ADD CONSTRAINT FK_P_REF_IMG_NO FOREIGN KEY(IMG_NO) REFERENCES IMG_ATTACHMENT(IMG_NO);

ALTER TABLE POINT ADD CONSTRAINT FK_PO_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE POINT_HISTORY ADD CONSTRAINT FK_PH_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE REPORT ADD CONSTRAINT FK_RP_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE REQUEST ADD CONSTRAINT FK_RQ_REF_TRASH_NO FOREIGN KEY(TRASH_NO) REFERENCES TRASH(TRASH_NO);
ALTER TABLE REQUEST ADD CONSTRAINT FK_RQ_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE SIGNATURE ADD CONSTRAINT FK_S_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE SUB_CATEGORY ADD CONSTRAINT FK_SC_REF_BIG_CATEGORY_NO FOREIGN KEY(BIG_CATEGORY_NO) REFERENCES BIG_CATEGORY(BIG_CATEGORY_NO);

ALTER TABLE SUGGESTION ADD CONSTRAINT FK_SG_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE TRASH ADD CONSTRAINT FK_T_REF_POST_NO FOREIGN KEY(TRASH_POST_NO) REFERENCES TRASH_POST(TRASH_POST_NO);
ALTER TABLE TRASH ADD CONSTRAINT FK_T_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);
ALTER TABLE TRASH ADD CONSTRAINT FK_T_REF_SUB_CATEGORY_NO FOREIGN KEY(SUB_CATEGORY_NO) REFERENCES TRASH_SUB_CATEGORY(SUB_CATEGORY_NO);

ALTER TABLE TRASH_HITS ADD CONSTRAINT FK_TH_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);
ALTER TABLE TRASH_HITS ADD CONSTRAINT FK_TH_REF_TRASH_NO FOREIGN KEY(TRASH_NO) REFERENCES TRASH(TRASH_NO);

ALTER TABLE TRASH_RECOMMEND ADD CONSTRAINT FK_TR_REF_TRASH_NO FOREIGN KEY(TRASH_NO) REFERENCES TRASH(TRASH_NO);
ALTER TABLE TRASH_RECOMMEND ADD CONSTRAINT FK_TR_REF_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO);

ALTER TABLE TRASH_SUB_CATEGORY ADD CONSTRAINT FK_TSC_REF_BIG_CATEGORY_NO FOREIGN KEY(BIG_CATEGORY_NO) REFERENCES TRASH_BIG_CATEGORY(BIG_CATEGORY_NO);

CREATE SEQUENCE SEQ_ATTNO;    
CREATE SEQUENCE SEQ_BCNO;    
CREATE SEQUENCE SEQ_BNO;   
CREATE SEQUENCE SEQ_BMNO;    
CREATE SEQUENCE SEQ_CNO;
CREATE SEQUENCE SEQ_GRNO;
CREATE SEQUENCE SEQ_HITNO;
CREATE SEQUENCE SEQ_IATTNO;
CREATE SEQUENCE SEQ_MNO;
CREATE SEQUENCE SEQ_NCNO;
CREATE SEQUENCE SEQ_PLENO;
CREATE SEQUENCE SEQ_PHNO;
CREATE SEQUENCE SEQ_POSTNO;
CREATE SEQUENCE SEQ_RPNO;
CREATE SEQUENCE SEQ_RQNO;
CREATE SEQUENCE SEQ_RNO;
CREATE SEQUENCE SEQ_SNO;
CREATE SEQUENCE SEQ_SCNO;
CREATE SEQUENCE SEQ_SUGNO;
CREATE SEQUENCE SEQ_TNO;
CREATE SEQUENCE SEQ_TBCNO;
CREATE SEQUENCE SEQ_THNO;
CREATE SEQUENCE SEQ_TPNO;
CREATE SEQUENCE SEQ_TSCNO;
CREATE SEQUENCE SEQ_UGNO;

COMMIT;