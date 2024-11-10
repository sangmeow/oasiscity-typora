CREATE TABLE IF NOT EXISTS garden.code (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  code_id               varchar(12)               NOT NULL                                  ,
  code_category         varchar(128)              NOT NULL                                  ,
  code_name             varchar(128)              NOT NULL                                  ,
  code_description      varchar(512)                                                        ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     ,
  updated_at            timestamp                                                           ,
  deleted_at            timestamp                                                           ,
  del_yn                boolean                   NOT NULL    DEFAULT FALSE   
);

CREATE UNIQUE INDEX code_idx            ON garden.code (idx);
CREATE UNIQUE INDEX code_uuid           ON garden.code (uuid);
CREATE UNIQUE INDEX code_code_id        ON garden.code (code_id);
CREATE INDEX        code_code_category  ON garden.code (code_category);
CREATE UNIQUE INDEX code_code_name      ON garden.code (code_name);

CREATE INDEX  hash_code_idx           ON garden.code      USING hash (idx);
CREATE INDEX  hash_code_uuid          ON garden.code      USING hash (uuid);
CREATE INDEX  hash_code_code_id       ON garden.code      USING hash (code_id);

CREATE INDEX  partial_code_deleted_at ON garden.code (created_at) WHERE deleted_at IS NULL;

COMMENT ON COLUMN garden.code.idx IS '코드 idx 값';
COMMENT ON COLUMN garden.code.uuid IS '코드 uuid 값';
COMMENT ON COLUMN garden.code.code_id IS '코드 아이디';
COMMENT ON COLUMN garden.code.code_category IS '코드 카테고리';
COMMENT ON COLUMN garden.code.code_name IS '코드 이름';
COMMENT ON COLUMN garden.code.code_description IS '코드 설명';
COMMENT ON COLUMN garden.code.created_at IS '코드 신청 생성일';
COMMENT ON COLUMN garden.code.updated_at IS '코드 신청 수정일';
COMMENT ON COLUMN garden.code.deleted_at IS '코드 신청 삭제일';
COMMENT ON COLUMN garden.code.del_yn IS '삭제여부';
