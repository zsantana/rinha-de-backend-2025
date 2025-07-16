CREATE UNLOGGED TABLE "Transactions" (
    "Id" UUID PRIMARY KEY,
    "Amout" DECIMAL NOT NULL,
    "requestedAt" TIMESTAMP NOT NULL,
    "Gateway" SMALLINT NOT NULL,
    "Status" SMALLINT NOT NULL DEFAULT 0
);

CREATE INDEX idx_transactions_covering_stats ON "Transactions" ("requestedAt", "Gateway") INCLUDE ("Amout");