# Felipe Melo - Rust Implementation

## Tecnologias Utilizadas

- **Linguagem**: Rust
- **Web Framework**: Axum
- **Banco de Dados**: PostgreSQL
- **Cache/Queue**: Redis
- **Load Balancer**: Nginx
- **Containerização**: Docker

## Arquitetura

A solução utiliza uma arquitetura baseada em microserviços com os seguintes componentes:

- **API**: Duas instâncias da API REST em Rust usando Axum
- **Payment Worker**: Workers dedicados para processar pagamentos de forma assíncrona
- **Health Checker**: Serviço para monitorar a saúde dos payment processors
- **Load Balancer**: Nginx para distribuição de carga
- **PostgreSQL**: Banco de dados principal para persistência
- **Redis**: Cache e sistema de filas

## Estratégia de Processamento

- Processamento assíncrono de pagamentos através de filas Redis
- Health checking contínuo dos payment processors
- Fallback automático baseado na disponibilidade e performance dos serviços
- Otimização de recursos com limites de CPU e memória

## Repositório

Código fonte disponível em: https://github.com/felipefrmelo/rinha-de-backend-imp-2025