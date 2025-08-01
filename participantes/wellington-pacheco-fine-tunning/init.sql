CREATE UNLOGGED TABLE IF NOT EXISTS payments (
    correlation_id UUID PRIMARY KEY,
    amount DECIMAL,
    service_name TEXT,
    inserted_at TIMESTAMP WITH TIME ZONE
);

DELETE FROM payments;

create index CONCURRENTLY idx_inserted_at_at_service_name ON payments(inserted_at, service_name);