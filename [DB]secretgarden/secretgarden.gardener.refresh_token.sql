CREATE TABLE IF NOT EXISTS gardener.refresh_token(
  idx                   BIGSERIAL PRIMARY KEY     NOT NULL                                  ,
  uuid                  uuid                      NOT NULL    DEFAULT uuid_generate_v4()    ,
  user_idx              BIGINT                    NOT NULL                                  ,
	user_uuid             uuid                      NOT NULL                                  ,
  hash_value            varchar(2048)             NOT NULL                                  ,
  created_at            timestamp                 NOT NULL    DEFAULT CURRENT_TIMESTAMP     
);

CREATE UNIQUE INDEX refresh_token_idx        ON gardener.refresh_token(idx,uuid,user_idx,user_uuid);

CREATE INDEX  hash_refresh_token_uuid        ON gardener.refresh_token  USING hash (uuid);
CREATE INDEX  hash_refresh_token_user_uuid   ON gardener.refresh_token  USING hash (user_uuid);

ALTER TABLE gardener.refresh_token ADD CONSTRAINT unique_refresh_token_uuid UNIQUE (uuid);
ALTER TABLE gardener.refresh_token ADD CONSTRAINT unique_refresh_token_user_uuid UNIQUE (user_uuid);