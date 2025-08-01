# Rinha Backend 2025 - Gustavo Miranda

## Descrição

Projeto desenvolvido em C# com ASP.NET Core versão 9.0.

Repositório do projeto: [link](https://github.com/gustmrg/rinha-backend-2025)

## Tecnologias

- C# / ASP.NET Core
- PostgreSQL
- Nginx
- Docker Compose

## Recursos de cada componente

| Container | Imagem                            | CPUs | Memória | Detalhes                  |
| --------- | --------------------------------- | ---- | ------- | ------------------------- |
| api01     | gustmrg/rinha-backend-2025:latest | 0.40 | 85MB    | API instance 1            |
| api02     | gustmrg/rinha-backend-2025:latest | 0.40 | 85MB    | API instance 2            |
| db        | postgres:17-alpine                | 0.45 | 130MB   | Database                  |
| nginx     | nginx:1.27.0-alpine               | 0.20 | 15MB    | Load balancer - port 9999 |
| **TOTAL** |                                   | 1.45 | 315MB   | -                         |
