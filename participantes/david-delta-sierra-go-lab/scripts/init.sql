ALTER DATABASE rinha SET TIME ZONE 'UTC';
ALTER SYSTEM SET fsync = 'off';
ALTER SYSTEM SET synchronous_commit = 'off';
ALTER SYSTEM SET full_page_writes = 'off';
ALTER SYSTEM SET logging_collector = 'off';
ALTER SYSTEM SET log_statement = 'none';
ALTER SYSTEM SET max_connections = 200;

CREATE UNLOGGED TABLE public.payments (
    correlation_id UUID PRIMARY KEY,
    amount DECIMAL NOT NULL,
    handler varchar NOT NULL,
    created_at timestamp NOT NULL
);