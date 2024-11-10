CREATE TABLE IF NOT EXISTS gardener.user (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  username              varchar(128)              NOT NULL                                  ,
  media                 varchar(32)                           DEFAULT 'local'               ,
  sns_idx               varchar(32)                                                         ,
  password              varchar(512)                                                        ,
  bio                   varchar(512)                                                        ,
  role                  varchar(32)                           DEFAULT 'user'                ,
  nickname              varchar(64)                                                         ,
  first_name            varchar(128)                                                        ,
  middle_name           varchar(128)                                                        ,
  last_name             varchar(128)                                                        ,
  birth_year            varchar(4)                                                          ,
  birth_month           varchar(2)                                                          ,
  birth_day             varchar(2)                                                          ,
  gender                char(1)                                                             ,
  email                 varchar(128)                                                        ,
  email_aes             varchar(512)                                                        ,
  mobile                varchar(32)                                                         ,
  mobile1               varchar(8)                                                          ,
  mobile2               varchar(8)                                                          ,
  mobile3               varchar(8)                                                          ,
  nationality           varchar(4)                                                          ,
  address               varchar(128)                                                        ,
  address1              varchar(64)                                                         ,
  address2              varchar(64)                                                         ,
  postal_code           varchar(12)                                                         ,
  company               varchar(32)                                                         ,
  department1           varchar(32)                                                         ,
  department2           varchar(32)                                                         ,
  phone                 varchar(24)                                                         ,
  phone1                varchar(8)                                                          ,
  phone2                varchar(8)                                                          ,
  phone3                varchar(8)                                                          ,
  company_country       varchar(8)                                                          ,
  company_address       varchar(128)                                                        ,
  company_address1      varchar(64)                                                         ,
  company_address2      varchar(64)                                                         ,
  company_postal_code   varchar(12)                                                         ,
  text                  text                                                                ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     ,
  updated_at            timestamp                                                           ,
  deleted_at            timestamp                                                           ,
  use_yn                boolean                   NOT NULL    DEFAULT TRUE                  ,
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
CREATE INDEX  hash_user_email_aes   ON gardener.user      USING hash (email_aes);

CREATE INDEX  partial_user_deleted_at ON gardener.user (created_at) WHERE deleted_at IS NULL;

COMMENT ON COLUMN gardener.user.idx                   IS '사용자 고유 인텍스 ID';
COMMENT ON COLUMN gardener.user.uuid                  IS '사용자 고유 값';
COMMENT ON COLUMN gardener.user.username              IS '사용자 아이디';
COMMENT ON COLUMN gardener.user.media                 IS '사용자 로그인 방식';
COMMENT ON COLUMN gardener.user.sns_idx               IS '사용자 SNS 고유값';
COMMENT ON COLUMN gardener.user.password              IS '[PBKDF2] 사용자 암호';
COMMENT ON COLUMN gardener.user.bio                   IS '사용자 소개';
COMMENT ON COLUMN gardener.user.role                  IS '사용자 권한';
COMMENT ON COLUMN gardener.user.nickname              IS '사용자 닉네임';
COMMENT ON COLUMN gardener.user.first_name            IS '사용자 이름';
COMMENT ON COLUMN gardener.user.middle_name           IS '사용자 이름';
COMMENT ON COLUMN gardener.user.last_name             IS '사용자 이름';
COMMENT ON COLUMN gardener.user.birth_year            IS '사용자 생년월일';
COMMENT ON COLUMN gardener.user.birth_month           IS '사용자 생년월일';
COMMENT ON COLUMN gardener.user.birth_day             IS '사용자 생년월일';
COMMENT ON COLUMN gardener.user.gender                IS '사용자 성별';
COMMENT ON COLUMN gardener.user.email                 IS '사용자 메일 주소';
COMMENT ON COLUMN gardener.user.email_aes             IS '[AES] 사용자 메일 주소';
COMMENT ON COLUMN gardener.user.mobile                IS '사용자 전화번호';
COMMENT ON COLUMN gardener.user.mobile1               IS '[AES] 사용자 전화번호';
COMMENT ON COLUMN gardener.user.mobile2               IS '[AES] 사용자 전화번호';
COMMENT ON COLUMN gardener.user.mobile3               IS '[AES] 사용자 전화번호';
COMMENT ON COLUMN gardener.user.nationality           IS '[CODE] 사용자 국가';
COMMENT ON COLUMN gardener.user.address               IS '사용자 주소';
COMMENT ON COLUMN gardener.user.address1              IS '[AES] 사용자 주소';
COMMENT ON COLUMN gardener.user.address2              IS '[AES] 사용자 주소';
COMMENT ON COLUMN gardener.user.postal_code           IS '사용자 우편번호';
COMMENT ON COLUMN gardener.user.company               IS '사용자 소속 기업';
COMMENT ON COLUMN gardener.user.department1           IS '사용자 소속 부서 1';
COMMENT ON COLUMN gardener.user.department2           IS '사용자 소속 부서 2';
COMMENT ON COLUMN gardener.user.phone                 IS '사용자 직장 전화번호';
COMMENT ON COLUMN gardener.user.phone1                IS '사용자 직장 전화번호 1';
COMMENT ON COLUMN gardener.user.phone2                IS '사용자 직장 전화번호 2';
COMMENT ON COLUMN gardener.user.phone3                IS '사용자 직장 전화번호 3';
COMMENT ON COLUMN gardener.user.company_country       IS '[CODE] 사용자 직장 국가';
COMMENT ON COLUMN gardener.user.company_address       IS '사용자 직장 주소';
COMMENT ON COLUMN gardener.user.company_address1      IS '사용자 직장 주소 1';
COMMENT ON COLUMN gardener.user.company_address2      IS '사용자 직장 주소 2';
COMMENT ON COLUMN gardener.user.company_postal_code   IS '사용자 직장 우편번호';
COMMENT ON COLUMN gardener.user.text                  IS '기타 내용';
COMMENT ON COLUMN gardener.user.created_at            IS '사용자 생성일';
COMMENT ON COLUMN gardener.user.updated_at            IS '사용자 수정일';
COMMENT ON COLUMN gardener.user.deleted_at            IS '사용자 삭제일';
COMMENT ON COLUMN gardener.user.use_yn                IS '사용여부';
COMMENT ON COLUMN gardener.user.del_yn                IS '삭제여부';