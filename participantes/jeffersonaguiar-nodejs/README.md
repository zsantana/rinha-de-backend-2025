# Rinha de Backend 2025 - Submissão

## Tecnologias utilizadas

- **Linguagem:** Typescript + NodeJs
- **Armazenamento/Fila:** Redis
- **Balanceador:** Nginx
- **Orquestração:** Docker Compose

## Como rodar

1. Suba o docker-compose dos Payment Processors primeiro (conforme instruções do repositório oficial).
2. Depois, suba este compose:
   ```sh
   docker compose up --build
   ```
3. O backend ficará disponível na porta **9999**.

## Sobre a solução

Minha solução para o desafio utiliza uma API com Fastify que atua como produtor de jobs de pagamento e um worker separado, usando BullMQ com Redis, que processa os pagamentos de forma assíncrona com fallback e controle de consistência.

## [Repositório do código-fonte](https://github.com/jeffersondossantosaguiar/rinha-backend-2025)
