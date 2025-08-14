## Rinha 2025

Implementação em Go para a [Rinha de Backend 2025](https://github.com/zanfranceschi/rinha-de-backend-2025).

Para detalhes da implementação, acesse: https://github.com/lauro-santana/rinha-backend-2025


## Tecnologias

- GO
- GOE ORM
- RabbitMQ
- PostgreSQL
- Nginx

Não penso que ORM seja ideal para esse desafio, mas esse ORM foi desenvolvido por mim e está sendo uma experiência interessante testa-lo em um ambiente como esse.

Utilizo o RabbitMQ para armazenar os payments recebidos via POST e de forma assíncrona uma gorotine consume os pagamentos e envia para os Payment Processors.

PostgreSQL é o banco de dados utilizado para simplificar a consulta do endpoint `/payments-summary`.