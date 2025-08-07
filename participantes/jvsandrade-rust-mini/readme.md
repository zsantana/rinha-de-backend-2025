# Tecnologias Utilizadas - Rinha de Backend 2025 (Branch `round_robin`)

Esta documentação detalha as escolhas tecnológicas e a arquitetura implementada para o desafio Rinha de Backend 2025. A seleção de cada componente foi guiada pelos princípios de máxima performance, baixa latência, resiliência e uso eficiente de recursos.

## Linguagem e Runtime

* **Linguagem: Rust**
    * **Justificativa:** Rust foi escolhido por sua performance "bare-metal" sem garbage collector, garantias de segurança de memória em tempo de compilação e primitivas de concorrência robustas, características ideais para um serviço de alta carga.

* **Runtime Assíncrono: Tokio**
    * **Justificativa:** Tokio é o runtime assíncrono padrão do ecossistema Rust. Ele gerencia o I/O de rede (HTTP, Redis, NATS) de forma não-bloqueante e agenda as tarefas `async` (`workers`, `handlers`) de maneira extremamente eficiente em um pool de threads.

## Servidor Web e Roteamento

* **Framework Web: Axum**
    * **Justificativa:** Um framework web minimalista e modular construído sobre o Tokio e a biblioteca `Tower`. Sua principal vantagem é a alta performance e a integração perfeita com o ecossistema `Tower` para a construção de pipelines de middleware.

* **Middleware: Tower**
    * **Justificativa:** `Tower` é usado para adicionar camadas de controle de carga ao servidor. Camadas como `BufferLayer` e `ConcurrencyLimitLayer` são aplicadas para criar "filas expressas" para rotas prioritárias e para proteger a aplicação de ser sobrecarregada por picos de tráfego.

## Fila de Trabalho e Concorrência

* **Fila de Trabalho: Tokio MPSC**
    * **Justificativa:** O coração da estratégia de concorrência. Em vez de uma única fila compartilhada que geraria contenção, a aplicação cria um **canal MPSC (`tokio::sync::mpsc`) dedicado para cada worker**.

* **Dispatcher: Round-Robin Atômico**
    * **Justificativa:** O handler `submit_work_handler` do Axum atua como um dispatcher. Ele usa um contador atômico (`AtomicUsize`) para distribuir as requisições recebidas entre os canais dos workers em um padrão **Round-Robin**. Isso elimina completamente a necessidade de `Mutex` na fila, permitindo que todos os workers operem em paralelo sem contenção, maximizando a vazão (throughput).

## Persistência de Dados

* **Banco de Dados: Redis**
    * **Justificativa:** Escolhido por sua altíssima velocidade para operações de escrita e leitura. É utilizado de duas formas:
        1.  **Armazenamento de Transações:** Cada pagamento processado é salvo como um JSON individual e indexado em um `Sorted Set` pela data com precisão de microssegundos.
        2.  **Sumários Pré-agregados:** Para que o endpoint `GET /payments-summary` seja quasi-instantâneo, a aplicação utiliza os comandos atômicos `HINCRBY` para atualizar contadores em "baldes" de tempo (um por segundo). A leitura do sumário consiste em buscar e somar esses poucos contadores, em vez de processar milhares de registros.

* **Pool de Conexões: `deadpool-redis`**
    * **Justificativa:** Gerencia um pool de conexões com o Redis de forma assíncrona, garantindo que os workers não percam tempo estabelecendo novas conexões a cada operação.

## Comunicação Inter-serviços

* **Mensageria: NATS**
    * **Justificativa:** NATS é usado como um sistema de pub/sub leve e rápido para a comunicação de estado entre as instâncias da API. A instância `LIDER` publica o status de saúde dos processadores de pagamento em um tópico NATS, e todas as outras instâncias (`COLABORADORAS`) se inscrevem nesse tópico para receber as atualizações em tempo real.

## Infraestrutura e Otimizações de Baixo Nível

* **Load Balancer: Nginx**
    * **Justificativa:** Nginx é configurado para alta performance, com múltiplos `worker_processes`, reutilização de conexões `keepalive` e logging de acesso desabilitado para minimizar o I/O em disco.

* **Containerização: Docker & Docker Compose**
    * **Justificativa:** A aplicação e todos os seus serviços são definidos no `docker-compose.yaml` para garantir um ambiente de execução consistente e reproduzível. O `Dockerfile` utiliza uma estratégia multi-stage para produzir uma imagem final mínima e segura.

* **Alocador de Memória: `jemalloc`**
    * **Justificativa:** O alocador de memória padrão do sistema é substituído pelo `jemalloc`. Ele é reconhecido por sua performance superior e menor fragmentação de memória em aplicações multi-threaded de longa duração, como este servidor.

* **Otimizações de Compilação:**
    * **Justificativa:** O `Cargo.toml` é configurado para que, em modo `release`, o compilador Rust aplique otimizações agressivas como LTO (Link-Time Optimization) e `codegen-units = 4`, resultando em um binário final menor e mais rápido.