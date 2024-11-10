CREATE TABLE IF NOT EXISTS garden.comment (
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  parent_idx            BIGINT                    NOT NULL                                  ,
  parent_uuid           uuid                      NOT NULL                                  ,
  board_idx             BIGINT                    NOT NULL                                  ,
  board_uuid            uuid                      NOT NULL                                  ,
  writer_idx            BIGINT                    NOT NULL                                  ,
  writer_uuid           uuid                      NOT NULL                                  ,
  title                 varchar(128)              NOT NULL                                  ,
  content               text                      NOT NULL                                  ,
  content_html          text                      NOT NULL                                  ,
  tag_idx               BIGINT                                                              ,
  tag_uuid              uuid                                                                ,
  is_secret             boolean                   NOT NULL    DEFAULT FALSE                 ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     ,
  updated_at            timestamp                                                           ,
  deleted_at            timestamp                                                           ,
  del_yn                boolean                   NOT NULL    DEFAULT FALSE
);

CREATE UNIQUE INDEX comment_idx          ON garden.comment (idx);
CREATE UNIQUE INDEX comment_uuid         ON garden.comment (uuid);
CREATE INDEX        comment_board_idx    ON garden.comment (board_idx);
CREATE INDEX        comment_board_uuid   ON garden.comment (board_uuid);

CREATE INDEX  hash_comment_idx           ON garden.comment      USING hash (idx);
CREATE INDEX  hash_comment_uuid          ON garden.comment      USING hash (uuid);
CREATE INDEX  hash_comment_board_idx     ON garden.comment      USING hash (board_idx);
CREATE INDEX  hash_comment_board_uuid    ON garden.comment      USING hash (board_uuid);

CREATE INDEX  partial_comment_deleted_at ON garden.comment (created_at) WHERE deleted_at IS NULL;

ALTER TABLE garden.comment ADD CONSTRAINT comment_fk_writer_idx FOREIGN KEY (writer_idx) REFERENCES gardener.user (idx);
ALTER TABLE garden.comment ADD CONSTRAINT comment_fk_writer_uuid FOREIGN KEY (writer_uuid) REFERENCES gardener.user (uuid);

ALTER TABLE garden.comment ADD CONSTRAINT comment_fk_board_idx FOREIGN KEY (board_idx) REFERENCES garden.board (idx);
ALTER TABLE garden.comment ADD CONSTRAINT comment_fk_board_uuid FOREIGN KEY (board_uuid) REFERENCES garden.board (uuid);

COMMENT ON COLUMN garden.comment.idx IS '댓글 idx 값';
COMMENT ON COLUMN garden.comment.uuid IS '댓글 uuid 값';
COMMENT ON COLUMN garden.comment.parent_idx IS '대댓글 생성 idx 값';
COMMENT ON COLUMN garden.comment.parent_uuid IS '대댓글 uuid 값';
COMMENT ON COLUMN garden.comment.board_idx IS '게시판 idx 값';
COMMENT ON COLUMN garden.comment.board_uuid IS '게시판 uuid 값';
COMMENT ON COLUMN garden.comment.writer_idx IS '작성자 idx 값';
COMMENT ON COLUMN garden.comment.writer_uuid IS '작성자 uuid 값';
COMMENT ON COLUMN garden.comment.title IS '댓글 제목';
COMMENT ON COLUMN garden.comment.content IS '댓글 내용';
COMMENT ON COLUMN garden.comment.content_html IS '댓글 html 내용';
COMMENT ON COLUMN garden.comment.tag_idx IS '댓글 태그 idx 값';
COMMENT ON COLUMN garden.comment.tag_uuid IS '댓글 태그 uuid 값';
COMMENT ON COLUMN garden.comment.is_secret IS '익명여부';
COMMENT ON COLUMN garden.comment.created_at IS '댓글 신청 생성일';
COMMENT ON COLUMN garden.comment.updated_at IS '댓글 신청 수정일';
COMMENT ON COLUMN garden.comment.deleted_at IS '댓글 신청 삭제일';
COMMENT ON COLUMN garden.comment.del_yn IS '삭제여부';
