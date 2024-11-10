CREATE TABLE IF NOT EXISTS garden.lounge (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  lounge_value          varchar(12)               NOT NULL                                  ,
  lounge_type           varchar(32)               NOT NULL                                  ,
  lounge_name           varchar(64)               NOT NULL                                  ,
  lounge_description    varchar(512)                                                        ,
  is_private            boolean                   NOT NULL    DEFAULT FALSE                 ,
  member_only           boolean                   NOT NULL    DEFAULT FALSE                 ,
  owner_idx             BIGINT                    NOT NULL                                  ,
  owner_uuid            uuid                      NOT NULL                                  ,
  description           text                                                                ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     ,
  updated_at            timestamp                                                           ,
  deleted_at            timestamp                                                           ,
  del_yn                boolean                   NOT NULL    DEFAULT FALSE   
);

CREATE UNIQUE INDEX lounge_idx          ON garden.lounge (idx);
CREATE UNIQUE INDEX lounge_uuid         ON garden.lounge (uuid);
CREATE UNIQUE INDEX lounge_lounge_value ON garden.lounge (lounge_value);
CREATE INDEX        lounge_type         ON garden.lounge (lounge_type);
CREATE UNIQUE INDEX lounge_name         ON garden.lounge (lounge_name);

CREATE INDEX  hash_lounge_idx           ON garden.lounge      USING hash (idx);
CREATE INDEX  hash_lounge_uuid          ON garden.lounge      USING hash (uuid);
CREATE INDEX  hash_lounge_lounge_value  ON garden.lounge      USING hash (lounge_value);
CREATE INDEX  hash_lounge_lounge_name   ON garden.lounge      USING hash (lounge_name);

CREATE INDEX  partial_lounge_deleted_at ON garden.lounge (created_at) WHERE deleted_at IS NULL;

ALTER TABLE garden.lounge ADD CONSTRAINT lounge_fk_owner_idx FOREIGN KEY (owner_idx) REFERENCES gardener.user (idx);
ALTER TABLE garden.lounge ADD CONSTRAINT lounge_fk_owner_uuid FOREIGN KEY (owner_uuid) REFERENCES gardener.user (uuid);

COMMENT ON COLUMN garden.lounge.idx IS '라운지 idx 값';
COMMENT ON COLUMN garden.lounge.uuid IS '라운지 uuid 값';
COMMENT ON COLUMN garden.lounge.lounge_value IS '라운지 코드 값';
COMMENT ON COLUMN garden.lounge.lounge_type IS '라운지 종류';
COMMENT ON COLUMN garden.lounge.lounge_name IS '라운지 이름';
COMMENT ON COLUMN garden.lounge.lounge_description IS '라운지 설명';
COMMENT ON COLUMN garden.lounge.is_private IS '라운지 공개여부';
COMMENT ON COLUMN garden.lounge.member_only IS '회원전용 여부';
COMMENT ON COLUMN garden.lounge.owner_idx IS '생성자 idx 값';
COMMENT ON COLUMN garden.lounge.owner_uuid IS '생정자 uuid 값';
COMMENT ON COLUMN garden.lounge.description IS '라운지 상세';
COMMENT ON COLUMN garden.lounge.created_at IS '라운지 신청 생성일';
COMMENT ON COLUMN garden.lounge.updated_at IS '라운지 신청 수정일';
COMMENT ON COLUMN garden.lounge.deleted_at IS '라운지 신청 삭제일';
COMMENT ON COLUMN garden.lounge.del_yn IS '삭제여부';
