-- CREATE TABLE
DROP TABLE ORDERS;

CREATE TABLE ORDERS (
	ORDER_NUM	NUMBER(10)		NOT NULL,
	RECEIVER_NAME	VARCHAR2(30)		NOT NULL,
	RECEIVER_PNUM	VARCHAR2(30)		NOT NULL,
	RECEIVER_ADDRESS	VARCHAR2(100)		NOT NULL,
	RECEIVER_DETAIL_ADDRESS	VARCHAR2(100)		NOT NULL,
	RECEIVER_HP	VARCHAR2(30)		NOT NULL,
	DELIVERY_MEMO	VARCHAR2(100)		NULL,
	ORDER_DATE	DATE	DEFAULT SYSDATE	NULL,
	TOTAL_PRICE	NUMBER(30)		NULL,
	USER_ID	VARCHAR2(30)		NOT NULL
);

DROP TABLE ITEM;

CREATE TABLE ITEM (
	ITEM_NUM	NUMBER(10)		NOT NULL,
	ITEM_NAME	VARCHAR2(30)		NOT NULL,
	ITEM_PRICE	VARCHAR2(30)		NOT NULL,
	ITEM_INFO	VARCHAR2(500)		NOT NULL,
	ITEM_THUMB	VARCHAR2(500)		NULL,
	ITEM_IMG	VARCHAR2(500)		NULL,
	ITEM_YN	CHAR(1)		NOT NULL,
	CATE_NUM	NUMBER(10)		NOT NULL
);

DROP TABLE USERS;

CREATE TABLE USERS (
	USER_ID	VARCHAR2(30)		NOT NULL,
	USER_PASSWD	VARCHAR2(30)		NOT NULL,
	USER_EMAIL	VARCHAR2(30)		NOT NULL,
	USER_HP	VARCHAR2(30)		NOT NULL,
	USER_NAME	VARCHAR2(30)		NOT NULL,
	USER_PNUM	VARCHAR2(30)		NOT NULL,
	DEFAULT_ADDRESS	VARCHAR2(100)		NOT NULL,
	DETAIL_ADDRESS	VARCHAR2(100)		NULL,
	REGDATE	DATE	DEFAULT SYSDATE	NULL
);

DROP TABLE CATEGORY;

CREATE TABLE CATEGORY (
	CATE_NUM	NUMBER(10)		NOT NULL,
	CATE_NAME	VARCHAR2(30)		NOT NULL,
	CATE_INFO	VARCHAR2(500)		NULL
);

DROP TABLE article;

CREATE TABLE article (
	ARTICLE_NUM	NUMBER(10)		NOT NULL,
	ARTICLE_TITLE	VARCHAR2(100)		NOT NULL,
	ARTICLE_CONTENT	VARCHAR2(500)		NOT NULL,
	ARTICLE_DATE	DATE	DEFAULT SYSDATE	NULL,
	HITCOUNT	NUMBER(20)	DEFAULT 0	NULL,
	USER_ID	VARCHAR2(30)		NOT NULL,
	BOARD_NUM	NUMBER(10)		NOT NULL
);

DROP TABLE board;

CREATE TABLE board (
	BOARD_NUM	NUMBER(10)		NOT NULL,
	BOARD_NAME	VARCHAR2(30)		NOT NULL,
	BOARD_INFO	VARCHAR2(500)		NULL
);

DROP TABLE ORDER_LIST;

CREATE TABLE ORDER_LIST (
	ITEM_NUM	NUMBER(10)		NOT NULL,
	ORDER_NUM	NUMBER(10)		NOT NULL,
	LIST_AMOUNT	NUMBER(5)	DEFAULT 1	NOT NULL,
	LIST_SIZE	NUMBER(5)		NOT NULL,
	LIST_PRICE	NUMBER(10)		NOT NULL
);

DROP TABLE article_comment;

CREATE TABLE article_comment (
	COMMENT_NUM	NUMBER(10)		NOT NULL,
	COMMENT_CONTENT	VARCHAR2(500)		NOT NULL,
	COMMENT_DATE	DATE	DEFAULT SYSDATE	NULL,
	ARTICLE_NUM	NUMBER(20)		NOT NULL,
	USER_ID	VARCHAR2(30)		NOT NULL
);












-- PRIMARY KEY
ALTER TABLE ORDERS ADD CONSTRAINT orders_order_num_pk PRIMARY KEY (
	ORDER_NUM
);

ALTER TABLE ITEM ADD CONSTRAINT item_item_num_pk PRIMARY KEY (
	ITEM_NUM
);

ALTER TABLE USERS ADD CONSTRAINT user_user_id_pk PRIMARY KEY (
	USER_ID
);

ALTER TABLE CATEGORY ADD CONSTRAINT cate_cate_num_pk PRIMARY KEY (
	CATE_NUM
);

ALTER TABLE article ADD CONSTRAINT article_article_num_pk PRIMARY KEY (
	ARTICLE_NUM
);

ALTER TABLE board ADD CONSTRAINT board_board_num_pk PRIMARY KEY (
	BOARD_NUM
);

ALTER TABLE article_comment ADD CONSTRAINT comment_comment_num_pk PRIMARY KEY (
	COMMENT_NUM
);












-- FOREIGN KEY + CHECK KEY
ALTER TABLE ITEM
  ADD(
    CONSTRAINT item_cate_num_fk FOREIGN KEY(cate_num) REFERENCES CATEGORY(cate_num),
    CONSTRAINT item_item_yn_ck CHECK (item_yn IN ('Y', 'N'))
);

ALTER TABLE ORDER_LIST
  ADD(
    CONSTRAINT order_list_item_num_fk FOREIGN KEY(item_num) REFERENCES ITEM(item_num),
    CONSTRAINT order_list_order_num_fk FOREIGN KEY(order_num) REFERENCES ORDERS(order_num)
);

ALTER TABLE ORDERS
  ADD(
    CONSTRAINT orders_user_id_fk FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

ALTER TABLE article_comment
  ADD(
    CONSTRAINT comment_article_num_fk FOREIGN KEY(article_num) REFERENCES article(article_num),
    CONSTRAINT comment_user_id_fk FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

ALTER TABLE ARTICLE
  ADD(
    CONSTRAINT article_user_id_fk FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    CONSTRAINT article_board_num_fk FOREIGN KEY(board_num) REFERENCES BOARD(board_num)
);












-- SEQUENCE
-- 카테고리 시퀀스
CREATE SEQUENCE cate_seq
  START WITH 10
  INCREMENT BY 10;
--
SELECT cate_seq.nextval
from dual;
--
drop sequence cate_seq;


-- 제품 시퀀스
CREATE SEQUENCE item_seq
  START WITH 1
  INCREMENT BY 1;
--
SELECT item_seq.nextval
from dual;
--
drop sequence item_seq;


-- 주문 시퀀스
CREATE SEQUENCE order_seq
  START WITH 1
  INCREMENT BY 1;
--
SELECT order_seq.nextval
from dual;
--
drop sequence order_seq;


-- 댓글 시퀀스
CREATE SEQUENCE comment_seq
  START WITH 1
  INCREMENT BY 1;
--
SELECT comment_seq.nextval
from dual;
--
drop sequence comment_seq;


-- 게시글 시퀀스
CREATE SEQUENCE article_seq
  START WITH 1
  INCREMENT BY 1;
--
SELECT article_seq.nextval
from dual;
--
drop sequence article_seq;


-- 게시판 시퀀스
CREATE SEQUENCE board_seq
  START WITH 10
  INCREMENT BY 10;
--
SELECT board_seq.nextval
from dual;
--
drop sequence board_seq;



-- 카테고리번호, 제품번호, 제품이름, 제품가격, 제품정보(설명), //판매여부
SELECT cate_num, item_num, item_name, item_price, item_info, item_thumb, item_img
FROM item
WHERE item_num = 1;







-- DUMMY DATA
-- 카테고리 1
INSERT INTO CATEGORY(cate_num, cate_name, cate_info)
VALUES(cate_seq.nextval, '스니커즈', '캐주얼한 디자인의 신발입니다.');

INSERT INTO CATEGORY(cate_num, cate_name, cate_info)
VALUES(cate_seq.nextval, '더비', '영한 느낌을 주는 디자인의 구두입니다.');

INSERT INTO CATEGORY(cate_num, cate_name, cate_info)
VALUES(cate_seq.nextval, '로퍼', '클래식한 디자인의 구두입니다.');

-- 제품 2
INSERT INTO ITEM(item_num, item_name, item_price, item_info, item_thumb, item_img, item_yn, cate_num)
VALUES(item_seq.nextval, '척 테일러', '70,000', '저렴하고 좋은 스니커즈입니다.', '썸네일', '이미지', 'Y', 10);

INSERT INTO ITEM(item_num, item_name, item_price, item_info, item_thumb, item_img, item_yn, cate_num)
VALUES(item_seq.nextval, '윙팁 더비 블랙', '199,000', '발이 편하고 윙팁 디테일이 들어간 더비슈즈입니다.', '썸네일', '이미지', 'Y', 20);

INSERT INTO ITEM(item_num, item_name, item_price, item_info, item_thumb, item_img, item_yn, cate_num)
VALUES(item_seq.nextval, '메탈 슬립온 페니로퍼', '149,000', '메탈 장식이 포인트인 로퍼입니다.', '썸네일', '이미지', 'Y', 30);

-- 주문항목 5
INSERT INTO ORDER_LIST(item_num, order_num, list_amount, list_size, list_price)
VALUES(1, 1, 2, 280, 70000);

INSERT INTO ORDER_LIST(item_num, order_num, list_amount, list_size, list_price)
VALUES(2, 2, 1, 250, 199000);

INSERT INTO ORDER_LIST(item_num, order_num, list_amount, list_size, list_price)
VALUES(3, 3, 1, 270, 149000);

-- 댓글 8
INSERT INTO article_comment(COMMENT_NUM, COMMENT_CONTENT, COMMENT_DATE, ARTICLE_NUM, USER_ID)
VALUES(comment_seq.nextval, '댓글 내용입니다.', sysdate, 1, 'hanzo1');

INSERT INTO article_comment(COMMENT_NUM, COMMENT_CONTENT, COMMENT_DATE, ARTICLE_NUM, USER_ID)
VALUES(comment_seq.nextval, '사이즈 문의 답변 드립니다.', sysdate, 2, 'hanzo2');

INSERT INTO article_comment(COMMENT_NUM, COMMENT_CONTENT, COMMENT_DATE, ARTICLE_NUM, USER_ID)
VALUES(comment_seq.nextval, '댓글 내용입니다2.', sysdate, 3, 'hanzo3');

-- 게시판 6
INSERT INTO board(board_num, board_name, board_info)
VALUES(board_seq.nextval, '일상 공유 게시판', '일상 공유 게시판 정보입니다.');

INSERT INTO board(board_num, board_name, board_info)
VALUES(board_seq.nextval, '상품 Q&A 게시판', '상품 Q&A 게시판 정보입니다.');

INSERT INTO board(board_num, board_name, board_info)
VALUES(board_seq.nextval, '공지사항 게시판', '공지사항 게시판 정보입니다.');

-- 게시글 7
INSERT INTO article(article_num, article_title, article_content, article_date, hitcount, user_id, board_num)
VALUES(article_seq.nextval, '안녕하세요', '만나서 반갑습니다.', sysdate, 1, 'hanzo1', 10);

INSERT INTO article(article_num, article_title, article_content, article_date, hitcount, user_id, board_num)
VALUES(article_seq.nextval, '상품 문의 게시글', '사이즈 문의 드립니다.', sysdate, 2, 'hanzo2', 20);

INSERT INTO article(article_num, article_title, article_content, article_date, hitcount, user_id, board_num)
VALUES(article_seq.nextval, '[공지사항]', '사이트 이용 방법 관련', sysdate, 4, 'hanzo3', 30);

-- 회원 3
INSERT INTO USERS(user_id, user_passwd, user_email, user_hp, user_name, user_pnum, default_address, detail_address, regdate)
VALUES ('hanzo1', '1111', 'hanzo1@gmail.com', '010-1111-2222','김한조','01010','한조시 한조구 한조동','한조아파트 1동 1호', sysdate);

INSERT INTO USERS(user_id, user_passwd, user_email, user_hp, user_name, user_pnum, default_address, detail_address, regdate)
VALUES ('hanzo2', '1111', 'hanzo2@gmail.com', '010-1111-3333','이한조','01010','한조시 한조구 한조동','한조아파트 1동 2호', sysdate);

INSERT INTO USERS(user_id, user_passwd, user_email, user_hp, user_name, user_pnum, default_address, detail_address, regdate)
VALUES ('hanzo2', '1111', 'hanzo2@gmail.com', '010-1111-3333','이한조','01010','한조시 한조구 한조동','한조아파트 1동 2호', sysdate);

-- 주문 4
INSERT INTO ORDERS(order_num, receiver_name, receiver_pnum, receiver_address, receiver_detail_address, receiver_hp, delivery_memo, order_date, total_price, user_id)
VALUES (order_seq.nextval, '제갈한조', '02020', '제갈시 제갈구 제갈동', '제갈아파트 2동 2호', '010-2222-3333', '부재시 문앞에 놓고 가세요', sysdate, 320000, 'hanzo1');

INSERT INTO ORDERS(order_num, receiver_name, receiver_pnum, receiver_address, receiver_detail_address, receiver_hp, delivery_memo, order_date, total_price, user_id)
VALUES (order_seq.nextval, '김한조', '01010', '한조시 한조구 한조동', '한조아파트 1동 1호', '010-1111-2222', '부재시 문앞에 놓고 가세요', sysdate, 520000, 'hanzo2');

INSERT INTO ORDERS(order_num, receiver_name, receiver_pnum, receiver_address, receiver_detail_address, receiver_hp, delivery_memo, order_date, total_price, user_id)
VALUES (order_seq.nextval, '김조한', '03030', '이젠시 이젠구 이젠동', '이젠아파트 3동 3호', '010-3333-4444', '부재시 문앞에 놓고 가세요', sysdate, 620000, 'hanzo3');

COMMIT;