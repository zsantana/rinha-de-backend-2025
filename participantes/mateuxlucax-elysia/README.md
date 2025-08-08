# Rinha de Backend 2025

![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)
![Bun](https://img.shields.io/badge/Bun-%23000000.svg?style=for-the-badge&logo=bun&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

Implementação do desafio da **Rinha de Backend 2025** utilizando **Typescript**, **ElysiaJS** e **Bun**.

Repositório do projeto: [https://github.com/mateuxlucax/rinha-de-backend-2025](https://github.com/mateuxlucax/rinha-de-backend-2025)

## Fluxo básico

```mermaid
flowchart TD
  K6 --> |Load Testing| Gateway[Gateway]
  Gateway[Gateway] -->|HTTP Requests| API-1[API-1]
  Gateway[Gateway] -->|HTTP Requests| API-2[API-2]
  API-1[API-1] -->|Enqueue| Valkey[(Valkey)]
  API-2[API-2] -->|Enqueue| Valkey[(Valkey)]
  Worker-1[Worker-1] -->|Dequeue| Valkey[(Valkey)]
  Worker-2[Worker-2] -->|Dequeue| Valkey[(Valkey)]
  Worker-1[Worker-1] -->|Process Payments| Processors[Payment Processors]
  Worker-2[Worker-2] -->|Process Payments| Processors[Payment Processors]
```

## Tecnologias utilizadas

- **Servidor HTTP**: [ElysiaJS](https://elysiajs.com/)
- **Balanceador de carga**: [HaProxy](https://haproxy.org/)
- **Armazenamento**: [Valkey](https://valkey.dev/)
- **Mensageria**: [Valkey](https://valkey.dev/)
- **Orquestração**: [Docker](https://www.docker.com/)
- **Linguagem principal**: [Typescript](https://www.typescriptlang.org/)
