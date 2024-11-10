CREATE TABLE IF NOT EXISTS gardener.user (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  email                 varchar(128)              NOT NULL                                  ,
  username              varchar(32)                                                         ,
  nickname              varchar(32)                                                         ,
  media                 varchar(32)                           DEFAULT 'local'               ,
  sns_idx               varchar(32)                                                         ,
  password              varchar(512)                                                        ,
  bio                   varchar(512)                                                        ,
  role                  varchar(32)                           DEFAULT 'user'                ,
  first_name            varchar(128)                                                        ,
  middle_name           varchar(128)                                                        ,
  last_name             varchar(128)                                                        ,
  birth                 varchar(8)                                                          ,
  gender                char(1)                                                             ,
  text                  text                                                                ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     ,
  updated_at            timestamp                                                           ,
  deleted_at            timestamp                                                           ,
  del_yn                boolean                   NOT NULL    DEFAULT FALSE                 
);

CREATE UNIQUE INDEX user_idx        ON gardener.user (idx);
CREATE UNIQUE INDEX user_uuid       ON gardener.user (uuid);
CREATE UNIQUE INDEX user_username   ON gardener.user (username);
CREATE UNIQUE INDEX user_nickname   ON gardener.user (nickname);
CREATE UNIQUE INDEX user_email      ON gardener.user (email);

CREATE INDEX  hash_user_uuid        ON gardener.user      USING hash (uuid);
CREATE INDEX  hash_user_username    ON gardener.user      USING hash (username);
CREATE INDEX  hash_user_nickname    ON gardener.user      USING hash (nickname);
CREATE INDEX  hash_user_email       ON gardener.user      USING hash (email);

CREATE INDEX  partial_user_deleted_at ON gardener.user (created_at) WHERE deleted_at IS NULL;

ALTER TABLE gardener.user ADD CONSTRAINT unique_user_uuid UNIQUE (uuid);
ALTER TABLE gardener.user ADD CONSTRAINT unique_user_username UNIQUE (username);
ALTER TABLE gardener.user ADD CONSTRAINT unique_user_nickname UNIQUE (nickname);
ALTER TABLE gardener.user ADD CONSTRAINT unique_user_email UNIQUE (email);

COMMENT ON COLUMN gardener.user.idx                   IS '사용자 고유 인텍스 ID';
COMMENT ON COLUMN gardener.user.uuid                  IS '사용자 고유 값';
COMMENT ON COLUMN gardener.user.email                 IS '사용자 메일 주소';
COMMENT ON COLUMN gardener.user.username              IS '사용자 아이디';
COMMENT ON COLUMN gardener.user.nickname              IS '사용자 닉네임';
COMMENT ON COLUMN gardener.user.media                 IS '사용자 로그인 방식';
COMMENT ON COLUMN gardener.user.sns_idx               IS '사용자 SNS 고유값';
COMMENT ON COLUMN gardener.user.password              IS '[PBKDF2] 사용자 암호';
COMMENT ON COLUMN gardener.user.bio                   IS '사용자 소개';
COMMENT ON COLUMN gardener.user.role                  IS '사용자 권한';
COMMENT ON COLUMN gardener.user.first_name            IS '사용자 이름';
COMMENT ON COLUMN gardener.user.middle_name           IS '사용자 이름';
COMMENT ON COLUMN gardener.user.last_name             IS '사용자 이름';
COMMENT ON COLUMN gardener.user.birth                 IS '사용자 생년월일';
COMMENT ON COLUMN gardener.user.gender                IS '사용자 성별';
COMMENT ON COLUMN gardener.user.text                  IS '기타 내용';
COMMENT ON COLUMN gardener.user.created_at            IS '사용자 생성일';
COMMENT ON COLUMN gardener.user.updated_at            IS '사용자 수정일';
COMMENT ON COLUMN gardener.user.deleted_at            IS '사용자 삭제일';
COMMENT ON COLUMN gardener.user.del_yn                IS '삭제여부';