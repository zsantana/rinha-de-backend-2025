rinhabackend-2025-go-redis

Implementação da Rinha de Backend 2025 utilizando Go, com um sistema de filas com channels, persistência e cache com Redis, e health check para garantir a escolha do melhor processador de pagamentos.

Tecnologias utilizadas

    Linguagem: Go 1.23

    Servidor HTTP: chi/v5 e fasthttp para os clientes

    Persistência e Cache: Redis

    Orquestração: Docker + Docker Compose

    Load Balancer: NGINX

Estratégia

    Processamento Assíncrono com Filas: Utilização de Go channels para criar uma fila de eventos de pagamento, permitindo que os pagamentos sejam processados de forma assíncrona e desacoplada do request inicial.

    Pool de Workers: Um pool de workers consome da fila de eventos, processando os pagamentos em paralelo para maximizar a vazão.

    Health Check e Failover: Um serviço de health check monitora constantemente os processadores de pagamento (default e fallback), escolhendo o mais saudável e com menor tempo de resposta. Em caso de falha ou lentidão do processador default, o sistema automaticamente utiliza o fallback.

    Cache de Health Status: O status de saúde dos processadores é armazenado em cache no Redis, permitindo que todas as instâncias da aplicação compartilhem o mesmo estado e tomem decisões consistentes.

    Escalabilidade Horizontal: A arquitetura foi projetada para ser escalável horizontalmente, com um load balancer NGINX distribuindo a carga entre múltiplas instâncias da aplicação.
