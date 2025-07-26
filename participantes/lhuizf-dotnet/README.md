# Rinha de Backend 2025

## Tecnologias utilizadas

- **Linguagem:** C# e .NET9.0
- **Armazenamento:**: Redis
- **Fila:** InMemory
- **Balanceador:** Nginx
- **Orquestração:** Docker Compose

## Como rodar

1. Suba os _Payment Processors_ com as instruções do repositório oficial.
2. Construa e suba o backend desenvolvido
   ```sh
   docker-compose up --build
   ```
3. O backend ficará disponível na porta **9999**, conforme as especificações do desafio.

## Sobre a solução

O backend foi desenvolvido em C# com .NET9.0. Para enfileira os pagamentos e utilizado o _Threading Channels_ do C# para salvar os pagamentos na memoria do backend. O worker pega as mensagens da fila e as processa de forma assíncrona e paralela, com um controle de concorrência para não sobrecarregar o backend. Para definir o processador do pagamento ele sempre tenta 3 vezes no default se não conseguir tenta o fallback e se ambas não estiverem operando, o pagamento volta para fila para uma retentativa mais tarde.

## Repositório do código-fonte

[https://github.com/LhuizF/rinha-de-backend-2025-dotnet](https://github.com/LhuizF/rinha-de-backend-2025-dotnet)
