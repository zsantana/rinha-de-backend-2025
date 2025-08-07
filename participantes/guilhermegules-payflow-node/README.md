# Payflow com Node e Fastify

## Descrição

Projeto desenvolvido em Node.js com Fastify, estruturado em arquitetura assíncrona baseada em worker e filas no Redis para processamento paralelo de pagamentos.

O repositório do projeto está [aqui](https://github.com/guilhermegules/rinha-payflow)

## Tecnologias utilizadas:

- Node.js / Fastify
- Redis
- PostgreSQL
- Nginx
- Docker Compose
- TypeScript

## Recursos de cada componente

| Container | Image                            | CPUs | Memory | Details                       |
| --------- | -------------------------------- | ---- | ------ | ----------------------------- |
| api-1     | guilhermegules/rinha-node:latest | 0.35 | 60MB   | API instance 1 – port 3000    |
| api-2     | guilhermegules/rinha-node:latest | 0.35 | 60MB   | API instance 2 - port 3000    |
| worker    | guilhermegules/rinha-node:latest | 0.3  | 70MB   | Worker for consuming payments |
| redis     | redis:7-alpine                   | 0.1  | 50MB   | Cache / Queue                 |
| db        | postgres:15-alpine               | 0.3  | 80MB   | Database                      |
| nginx     | nginx:latest                     | 0.1  | 30MB   | Load balancer – port 9999     |
| **TOTAL** |                                  | 1.5  | 350MB  | -                             |
