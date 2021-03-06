-- infra_file
-- infra_file_attr
-- infra_ts_kv
-- infra_ts_kv_latest
-- infra_tag
-- infra_tag_entity_relation
-- infra_verification_code
CREATE TABLE infra_file
(
    id              BIGINT AUTO_INCREMENT,
    tenant_id       BIGINT                                                          NOT NULL,
    deleted_at      TIMESTAMP DEFAULT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP                             NOT NULL,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    name            VARCHAR(128),
    size            BIGINT,
    file_md5        VARCHAR(32),
    save_type       VARCHAR(128),
    file_store_info VARCHAR(10240),
    PRIMARY KEY (id)
);
CREATE TABLE infra_file_attr
(
    id         BIGINT AUTO_INCREMENT,
    tenant_id  BIGINT                                                          NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP                             NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    file_id    BIGINT                                                          NOT NULL,
    attr_name  VARCHAR(32),
    attr_value VARCHAR(128),
    PRIMARY KEY (id)
);
CREATE TABLE infra_ts_kv
(
    entity_type VARCHAR(255) NOT NULL,
    entity_id   BIGINT       NOT NULL,
    `key`       VARCHAR(255) NOT NULL,
    ts          BIGINT       NOT NULL,
    bool_v      TINYINT,
    long_v      BIGINT,
    dbl_v       DOUBLE,
    str_v       VARCHAR(102400),
    PRIMARY KEY (entity_type, entity_id, `key`, ts)
);
CREATE TABLE infra_ts_kv_latest
(
    entity_type VARCHAR(255) NOT NULL,
    entity_id   BIGINT       NOT NULL,
    `key`       VARCHAR(255) NOT NULL,
    ts          BIGINT       NOT NULL,
    bool_v      TINYINT,
    long_v      BIGINT,
    dbl_v       DOUBLE,
    str_v       VARCHAR(102400),
    PRIMARY KEY (entity_type, entity_id, `key`, ts)
);
CREATE TABLE infra_tag
(
    id         BIGINT AUTO_INCREMENT,
    tenant_id  BIGINT                                                          NOT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP                             NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    tag_type   VARCHAR(255)                                                    NOT NULL,
    tag        VARCHAR(255)                                                    NOT NULL,
    creator_id BIGINT                                                          NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE infra_tag_entity_relation
(
    id          BIGINT AUTO_INCREMENT,
    tenant_id   BIGINT                                                          NOT NULL,
    deleted_at  TIMESTAMP DEFAULT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP                             NOT NULL,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    tag_id      BIGINT                                                          NOT NULL,
    entity_id   BIGINT                                                          NOT NULL,
    entity_type VARCHAR(64)                                                     NOT NULL,
    creator_id  BIGINT                                                          NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE infra_verification_code
(
    id          BIGINT AUTO_INCREMENT,
    tenant_id   BIGINT                                                          NOT NULL,
    deleted_at  TIMESTAMP DEFAULT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP                             NOT NULL,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    user_id     BIGINT                                                          NOT NULL,
    code        VARCHAR(255)                                                    NOT NULL,
    type        VARCHAR(32)                                                     NOT NULL,
    channel     VARCHAR(32)                                                     NOT NULL,
    send_dst    VARCHAR(1024)                                                   NOT NULL,
    sent_at     TIMESTAMP,
    verified_at TIMESTAMP,
    expire_at   TIMESTAMP,
    PRIMARY KEY (id)
);
CREATE TABLE infra_task
(
    id         BIGINT AUTO_INCREMENT,
    tenant_id  BIGINT                                                          NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP                             NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    percent    INT       DEFAULT 0                                             NOT NULL,
    status     VARCHAR(32)                                                     NOT NULL,
    type       VARCHAR(64)                                                     NOT NULL,
    extra_info TEXT,
    PRIMARY KEY (id)
);
ALTER TABLE infra_task
    ADD COLUMN (deleted_at TIMESTAMP NULL DEFAULT NULL);
ALTER TABLE infra_task
    ADD COLUMN (start_at TIMESTAMP NULL DEFAULT NULL);
ALTER TABLE infra_task
    ADD COLUMN (will_abort_at TIMESTAMP NULL DEFAULT NULL);
