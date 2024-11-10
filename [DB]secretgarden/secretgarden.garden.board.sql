CREATE TABLE IF NOT EXISTS garden.board (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  lounge_idx            BIGINT                    NOT NULL                                  ,
  lounge_uuid           uuid                      NOT NULL                                  ,
  writer_idx            BIGINT                    NOT NULL                                  ,
  writer_uuid           uuid                      NOT NULL                                  ,
  title                 varchar(128)              NOT NULL                                  ,
  content               text                      NOT NULL                                  ,
  content_html          text                      NOT NULL                                  ,
  content_img           varchar(1024)                                                       ,
  content_youtube       varchar(1024)                                                       ,
  tag_idx               BIGINT                                                              ,
  tag_uuid              uuid                                                                ,
  is_secret             boolean                   NOT NULL    DEFAULT FALSE                 ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     ,
  updated_at            timestamp                                                           ,
  deleted_at            timestamp                                                           ,
  del_yn                boolean                   NOT NULL    DEFAULT FALSE
);

CREATE UNIQUE INDEX board_idx          ON garden.board (idx);
CREATE UNIQUE INDEX board_uuid         ON garden.board (uuid);
CREATE INDEX        board_lounge_idx   ON garden.board (lounge_idx);
CREATE INDEX        board_lounge_uuid  ON garden.board (lounge_uuid);

CREATE INDEX  hash_board_idx           ON garden.board      USING hash (idx);
CREATE INDEX  hash_board_uuid          ON garden.board      USING hash (uuid);
CREATE INDEX  hash_board_lounge_idx    ON garden.board      USING hash (lounge_idx);
CREATE INDEX  hash_board_lounge_uuid   ON garden.board      USING hash (lounge_uuid);

CREATE INDEX  partial_board_deleted_at ON garden.board (created_at) WHERE deleted_at IS NULL;

ALTER TABLE garden.board ADD CONSTRAINT board_fk_writer_idx FOREIGN KEY (writer_idx) REFERENCES gardener.user (idx);
ALTER TABLE garden.board ADD CONSTRAINT board_fk_wrter_uuid FOREIGN KEY (writer_uuid) REFERENCES gardener.user (uuid);

ALTER TABLE garden.board ADD CONSTRAINT board_fk_lounge_idx FOREIGN KEY (lounge_idx) REFERENCES garden.lounge (idx);
ALTER TABLE garden.board ADD CONSTRAINT board_fk_lounge_uuid FOREIGN KEY (lounge_uuid) REFERENCES garden.lounge (uuid);

COMMENT ON COLUMN garden.board.idx IS '게시판 idx 값';
COMMENT ON COLUMN garden.board.uuid IS '게시판 uuid 값';
COMMENT ON COLUMN garden.board.lounge_idx IS '라운지 idx 값';
COMMENT ON COLUMN garden.board.lounge_uuid IS '라운지 uuid 값';
COMMENT ON COLUMN garden.board.writer_idx IS '작성자 idx 값';
COMMENT ON COLUMN garden.board.writer_uuid IS '작성자 uuid 값';
COMMENT ON COLUMN garden.board.title IS '게시판 제목';
COMMENT ON COLUMN garden.board.content IS '게시판 내용';
COMMENT ON COLUMN garden.board.content_html IS '게시판 html 내용';
COMMENT ON COLUMN garden.board.content_img IS '이미지 게시판 내용';
COMMENT ON COLUMN garden.board.content_youtube IS '유튜브 게시판 내용';
COMMENT ON COLUMN garden.board.tag_idx IS '게시판 태그 idx 값';
COMMENT ON COLUMN garden.board.tag_uuid IS '게시판 태그 uuid 값';
COMMENT ON COLUMN garden.board.is_secret IS '익명여부';
COMMENT ON COLUMN garden.board.created_at IS '게시판 신청 생성일';
COMMENT ON COLUMN garden.board.updated_at IS '게시판 신청 수정일';
COMMENT ON COLUMN garden.board.deleted_at IS '게시판 신청 삭제일';
COMMENT ON COLUMN garden.board.del_yn IS '삭제여부';
