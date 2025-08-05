CREATE UNLOGGED TABLE transactions (
    "CorrelationId" UUID PRIMARY KEY,
    "Amount" NUMERIC(18,2) NOT NULL,
    "RequestedAt" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "Gateway" BOOLEAN NOT NULL DEFAULT TRUE,
    "Status" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX idx_transactions ON transactions ("CorrelationId");
--CREATE INDEX idx_transactions_search ON transactions ("Status", "Gateway", "RequestedAt");


CREATE OR REPLACE FUNCTION notify_trigger() 
RETURNS TRIGGER AS $trigger$
DECLARE
  channel_name TEXT;
BEGIN
  IF NEW."Status" = TRUE THEN
    RETURN NEW;
  END IF;

  channel_name := 'payment_transaction_primary';

  IF NEW."Gateway" = FALSE THEN
    channel_name := 'payment_transaction_fallback';
  END IF;

  PERFORM pg_notify(channel_name, row_to_json(NEW)::text);

  RETURN NEW;
END;
$trigger$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER transactions_notify_trigger
AFTER INSERT OR UPDATE ON public.transactions
FOR EACH ROW EXECUTE PROCEDURE notify_trigger();