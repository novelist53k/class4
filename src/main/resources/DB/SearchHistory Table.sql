CREATE TABLE SearchHistory(
    shno NUMBER(10) PRIMARY KEY,        -- 고유키
    searchUserId VARCHAR2(50) NOT NULL, -- 아이디
    keyword VARCHAR2(50) NOT NULL       -- 검색어
);
CREATE SEQUENCE search_history_seq START WITH 1 INCREMENT BY 1 NOCACHE;