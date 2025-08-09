# Rinha de Backend 2025 - Submissão

## 🚀 Tecnologias utilizadas

- **Linguagem:** NODE  
- **Armazenamento / Fila:** Redis  
- **Balanceador:** Nginx  
- **Orquestração:** Docker Compose

---

## ⚙️ Como rodar

**Suba o `docker-compose` dos Payment Processors**  
(conforme instruções do [repositório oficial](https://github.com/Rinha-de-Backend-Official/2025)).

**Projeto**: https://github.com/djbrunomonteiro/api-rinha-backend-2025

**Depois, suba este compose:**

```bash
docker compose up --build

```

##  Estratégia

Recebe as requisições e direciona preferencialmente para a instancia 1 da API que possui maior processamento.
Cada API tem sua propria fila que é processada em background utilizando a estratégia de Multiprocessing via módulo Cluster.
Utilizo a abordagem reativa do RXJS para controle e direcionamento. Por fim salvo tudo no Redis.
