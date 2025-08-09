# Rinha de Backend 2025 - Submissão Node.js

Projeto para participar da 🐓[Rinha de Backend 2025](https://github.com/zanfranceschi/rinha-de-backend-2025)

## Arquitetura

```
[Load Test] --> [nginx] --> [API 1] --> [PostgreSQL]
                       --> [API 2] ----^
                           |  |
                           v  v
                    [Payment Processors]
```

## Tecnologias Utilizadas

- **Linguagem**: Node.js + TypeScript
- **Framework**: Fastify
- **Banco de Dados**: PostgreSQL
- **Cache/Queue**: Redis + BullMQ
- **Load Balancer**: nginx
- **Containerização**: Docker

## Estratégia

### Gerenciamento de Falhas

- **Circuit breaker** para os payment processors
- **Retry automático** com backoff exponencial
- **Fallback** automático entre processadores
- **Health check** periódico dos serviços

### Otimização de Performance

- **Connection pooling** no PostgreSQL
- **Redis** para cache e filas assíncronas
- **nginx** com least_conn load balancing
- **Buffers otimizados** no nginx

### Consistência de Dados

- **Transações atômicas** no PostgreSQL
- **Idempotência** com correlation_id único
- **Retry queue** para falhas temporárias
- **Auditoria** completa de todos os pagamentos

## Código Fonte

O código fonte completo está disponível em: https://github.com/drope-dev/rinha-backend-node

## Como Executar

1. Clone o repositório
2. Configure as variáveis de ambiente
3. Execute os payment processors:
   ```bash
   cd payment-processor
   docker-compose up -d
   ```
4. Execute sua aplicação:
   ```bash
   cd participantes/drope-dev-rinha-backend-node
   docker-compose up
   ```

## Endpoints

- `POST /payments` - Processa pagamentos
- `GET /payments-summary` - Retorna resumo dos pagamentos

## Recursos de CPU e Memória

- **Total**: 1.5 CPU e 350MB RAM
- **nginx**: 0.2 CPU e 50MB RAM
- **api-1**: 0.4 CPU e 100MB RAM
- **api-2**: 0.4 CPU e 100MB RAM
- **postgres**: 0.5 CPU e 100MB RAM
