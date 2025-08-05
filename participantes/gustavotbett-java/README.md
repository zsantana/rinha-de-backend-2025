# Projeto de Teste: Redis com Spring Boot

Este é um projeto simples de teste que integra **Redis** com **Spring Boot**, utilizando `ReactiveRedisTemplate` para realizar **Pub/Sub reativo** e **armazenamento em ZSet**.

## Funcionalidades

- Envio de dados via endpoint `/payments` para uma fila Redis.
- Leitura reativa do canal Redis com consumo e fallback.
- Salvamento de dados organizados em ZSet para posterior análise.
- Health check de APIs externas para decidir se o envio será feito no destino padrão ou fallback.
- Serialização e desserialização de objetos `Payment` com **Jackson**.

## Tecnologias

- Java 21  
- Spring Boot 3  
- Spring Data Redis (reativo)  
- Docker + Docker Compose  
- Redis
- WebFlux

## Status

✅ Projeto funcional para testes locais.  
⚠️ O README será atualizado com instruções completas de uso, endpoints, arquitetura e exemplos de payload **em breve**.

---

📌 Para dúvidas ou sugestões, entre em contato.

