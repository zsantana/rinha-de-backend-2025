# Rinha de Backend 2025 - Submissão com Node.js + TypeScript

**Repositório do Código-Fonte:** https://github.com/Luzin7/rinha-backend-2025-ts-nodejs

## Stack Tecnológica

* **Linguagem:** TypeScript
* **Runtime:** Node.js
* **Framework API:** Fastify
* **Load Balancer:** Nginx
* **Fila & Cache:** Redis
* **Banco de Dados:** PostgreSQL
* **I/O Drivers:** undici e pg

---

## Arquitetura

A solução foi projetada seguindo os princípios de microsserviços e uma arquitetura orientada a eventos.

### Diagrama do Fluxo

```mermaid
graph TD
    subgraph "Cliente (k6)"
        A[HTTP Requests]
    end

    subgraph "Sua Aplicação (Docker Compose)"
        B(Nginx <br> Load Balancer)
        
        subgraph "API Servers"
            C1[API 01]
            C2[API 02]
        end

        subgraph "Processing Services"
            E1[Worker 01]
            E2[Worker 02]
        end
        
        subgraph "Redis (Fila Confiável)"
            direction LR
            D1[1. Job Queue]
            D2[2. Processing Queue]
            D3[3. Status Cache]
        end
        
        F(PostgreSQL <br> System of Record)
    end
    
    subgraph "Serviços Externos"
        G[Payment Processors]
    end

    A -- POST /payments --> B
    B --> C1 & C2
    C1 & C2 -- 1. Enfileira Job --> D1
    
    E1 & E2 -- 2. Pega Job (BRPOPLPUSH) --> D1
    D1 -- Move para --> D2
    
    E1 & E2 -- 3. Lê Status --> D3
    E1 & E2 -- 4. Processa e chama --> G
    
    G -- Sucesso --> E1 & E2

    E1 & E2 -- 5. Salva no --> F
    E1 & E2 -- 6. Remove Job de --> D2
```