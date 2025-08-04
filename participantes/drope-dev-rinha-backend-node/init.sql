-- Tabela para armazenar pagamentos processados
CREATE TABLE IF NOT EXISTS processed_payments (
    id SERIAL PRIMARY KEY,
    correlation_id UUID UNIQUE NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    processor VARCHAR(20) NOT NULL CHECK (processor IN ('default', 'fallback')),
    requested_at TIMESTAMP NOT NULL,
    processed_at TIMESTAMP DEFAULT NOW(),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_processed_payments_processor ON processed_payments(processor);
CREATE INDEX IF NOT EXISTS idx_processed_payments_requested_at ON processed_payments(requested_at);
CREATE INDEX IF NOT EXISTS idx_processed_payments_processed_at ON processed_payments(processed_at);
CREATE INDEX IF NOT EXISTS idx_processed_payments_correlation_id ON processed_payments(correlation_id);