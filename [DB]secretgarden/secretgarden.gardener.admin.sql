CREATE TABLE IF NOT EXISTS gardener.admin (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  username              varchar(128)              NOT NULL                                  ,
  password              varchar(512)              NOT NULL                                  ,
  bio                   varchar(512)                                                        ,
  role                  varchar(32)                           DEFAULT 'admin'               ,
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

CREATE UNIQUE INDEX admin_idx        ON gardener.admin (idx);
CREATE UNIQUE INDEX admin_uuid       ON gardener.admin (uuid);
CREATE UNIQUE INDEX admin_username   ON gardener.admin (username);
CREATE UNIQUE INDEX admin_nickname   ON gardener.admin (nickname);
CREATE UNIQUE INDEX admin_email      ON gardener.admin (email);

CREATE INDEX  hash_admin_uuid        ON gardener.admin     USING hash (uuid);
CREATE INDEX  hash_admin_username    ON gardener.admin     USING hash (username);
CREATE INDEX  hash_admin_nickname    ON gardener.admin     USING hash (nickname);
CREATE INDEX  hash_admin_email       ON gardener.admin     USING hash (email);
CREATE INDEX  hash_admin_email_aes   ON gardener.admin     USING hash (email_aes);

CREATE INDEX  partial_admin_deleted_at ON gardener.admin (created_at) WHERE deleted_at IS NULL;

COMMENT ON COLUMN gardener.admin.idx                  IS '관리자 고유 인텍스 ID';
COMMENT ON COLUMN gardener.admin.uuid                 IS '관리자 고유 값';
COMMENT ON COLUMN gardener.admin.username             IS '관리자 아이디';
COMMENT ON COLUMN gardener.admin.password             IS '[PBKDF2] 관리자 암호';
COMMENT ON COLUMN gardener.admin.role                 IS '관리자 권한';
COMMENT ON COLUMN gardener.admin.nickname             IS '관리자 닉네임';
COMMENT ON COLUMN gardener.admin.first_name           IS '관리자 이름';
COMMENT ON COLUMN gardener.admin.middle_name          IS '관리자 이름';
COMMENT ON COLUMN gardener.admin.last_name            IS '관리자 이름';
COMMENT ON COLUMN gardener.admin.birth_year           IS '관리자 생년월일';
COMMENT ON COLUMN gardener.admin.birth_month          IS '관리자 생년월일';
COMMENT ON COLUMN gardener.admin.birth_day            IS '관리자 생년월일';
COMMENT ON COLUMN gardener.admin.gender               IS '관리자 성별';
COMMENT ON COLUMN gardener.admin.email                IS '관리자 메일 주소';
COMMENT ON COLUMN gardener.admin.email_aes            IS '[AES] 관리자 메일 주소';
COMMENT ON COLUMN gardener.admin.mobile               IS '관리자 전화번호';
COMMENT ON COLUMN gardener.admin.mobile1              IS '[AES] 관리자 전화번호';
COMMENT ON COLUMN gardener.admin.mobile2              IS '[AES] 관리자 전화번호';
COMMENT ON COLUMN gardener.admin.mobile3              IS '[AES] 관리자 전화번호';
COMMENT ON COLUMN gardener.admin.nationality          IS '[CODE] 관리자 국가';
COMMENT ON COLUMN gardener.admin.address              IS '관리자 주소';
COMMENT ON COLUMN gardener.admin.address1             IS '[AES] 관리자 주소';
COMMENT ON COLUMN gardener.admin.address2             IS '[AES] 관리자 주소';
COMMENT ON COLUMN gardener.admin.postal_code          IS '관리자 우편번호';
COMMENT ON COLUMN gardener.admin.company              IS '관리자 소속 기업';
COMMENT ON COLUMN gardener.admin.department1          IS '관리자 소속 부서 1';
COMMENT ON COLUMN gardener.admin.department2          IS '관리자 소속 부서 2';
COMMENT ON COLUMN gardener.admin.phone                IS '관리자 직장 전화번호';
COMMENT ON COLUMN gardener.admin.phone1               IS '관리자 직장 전화번호 1';
COMMENT ON COLUMN gardener.admin.phone2               IS '관리자 직장 전화번호 2';
COMMENT ON COLUMN gardener.admin.phone3               IS '관리자 직장 전화번호 3';
COMMENT ON COLUMN gardener.admin.company_country      IS '[CODE] 관리자 직장 국가';
COMMENT ON COLUMN gardener.admin.company_address1     IS '관리자 직장 주소';
COMMENT ON COLUMN gardener.admin.company_address1     IS '관리자 직장 주소 1';
COMMENT ON COLUMN gardener.admin.company_address2     IS '관리자 직장 주소 2';
COMMENT ON COLUMN gardener.admin.company_postal_code  IS '관리자 직장 우편번호';
COMMENT ON COLUMN gardener.admin.text                 IS '기타 내용';
COMMENT ON COLUMN gardener.admin.created_at           IS '관리자 생성일';
COMMENT ON COLUMN gardener.admin.updated_at           IS '관리자 수정일';
COMMENT ON COLUMN gardener.admin.deleted_at           IS '관리자 삭제일';
COMMENT ON COLUMN gardener.admin.use_yn               IS '사용여부';
COMMENT ON COLUMN gardener.admin.del_yn               IS '삭제여부';