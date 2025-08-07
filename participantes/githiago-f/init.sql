CREATE TYPE service_type AS ENUM('fallback', 'default');

CREATE TABLE IF NOT EXISTS payments (
  correlation_id UUID NOT NULL PRIMARY KEY,
  amount NUMERIC NOT NULL,
  requested_at TIMESTAMP NOT NULL,
  service service_type DEFAULT 'default'::service_type
);

CREATE INDEX request_time ON payments (requested_at);
