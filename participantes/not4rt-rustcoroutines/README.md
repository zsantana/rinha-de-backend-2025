# Rinha de Backend 2025

## Stack: Rust com [may](https://github.com/Xudong-Huang/may) para async
Repositorio: https://github.com/not4rt/rinha-2025

## Arquitetura
- HAProxy: Load balancer (porta 9999) distribuindo tráfego entre 2 backends
- Backend1/Backend2: Instâncias HTTP idênticas (porta 8080) para receber pagamentos, com worker em background para envia-los para os processors e inmemory store para o summary

## Fluxo de Pagamentos
1. Recepção
- Endpoint /payments recebe PaymentRequest via JSON
- Valida payload e insere na fila (tabela payments)
- Retorna imediatamente

2. Processamento Assíncrono
- Workers consultam fila de pagamentos pendentes
- Fallback automático: se processador principal falha, usa o secundário