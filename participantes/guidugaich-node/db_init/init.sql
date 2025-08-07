DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    id BIGSERIAL PRIMARY KEY,
    correlation_id UUID UNIQUE NOT NULL,
    amount_cents INTEGER NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    processor VARCHAR(20),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE
);  