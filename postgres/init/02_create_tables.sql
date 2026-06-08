CREATE TABLE uploaded_files
(
    id          BIGSERIAL PRIMARY KEY,
    filename    VARCHAR(255) NOT NULL,
    mime_type   VARCHAR(100) NOT NULL,
    content     BYTEA        NOT NULL,
    status      VARCHAR(50)  NOT NULL DEFAULT 'PENDING',
    uploaded_at TIMESTAMP             DEFAULT NOW()
);

CREATE TABLE transactions
(
    id               BIGSERIAL PRIMARY KEY,
    reference        VARCHAR(255)   NOT NULL,
    label            VARCHAR(255)   NOT NULL,
    amount           NUMERIC(15, 2) NOT NULL,
    currency         VARCHAR(10)    NOT NULL,
    date             DATE           NOT NULL,
    category         VARCHAR(100),
    uploaded_file_id BIGINT REFERENCES uploaded_files (id),
    created_at       TIMESTAMP DEFAULT NOW()
);

CREATE TABLE import_logs
(
    id               BIGSERIAL PRIMARY KEY,
    uploaded_file_id BIGINT REFERENCES uploaded_files (id),
    status           VARCHAR(50) NOT NULL,
    total_records    INT,
    valid_records    INT,
    rejected_records INT,
    error_message    TEXT,
    started_at       TIMESTAMP,
    finished_at      TIMESTAMP
);

CREATE TABLE rejected_transactions
(
    id            BIGSERIAL PRIMARY KEY,
    import_log_id BIGINT REFERENCES import_logs (id),
    reference     VARCHAR(255),
    field         VARCHAR(100),
    reason        TEXT,
    rejected_at   TIMESTAMP DEFAULT NOW()
);