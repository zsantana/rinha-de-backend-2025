# Rinha de Backend 2025 — Alexandre Beilner
[![Repositório no GitHub](https://img.shields.io/badge/GitHub-Repo-blue?logo=github)](https://github.com/AlexandreBeilner/rinha-backend-php)


Entrega oficial para a competição Rinha de Backend 2025  
Implementação em PHP + Redis + Nginx

## Endpoints expostos

* POST `/payments`: Recebe pagamentos para processamento.
* GET `/payments-summary`: Retorna o resumo dos pagamentos processados. Suporta filtros por data (`from`, `to`).

O sistema estará acessível em:
[http://localhost:9999](http://localhost:9999)

## Containers

* back1 / back2: API PHP-FPM, recebe e enfileira pagamentos.
* queue: Worker PHP, processa a fila e interage com os processadores externos.
* lb: Load balancer Nginx.
* redis: Persistência da fila e pagamentos.

## Recursos

O compose já está configurado para limitar memória e CPU conforme o regulamento.
