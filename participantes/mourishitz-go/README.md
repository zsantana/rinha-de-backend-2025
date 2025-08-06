# Mourishitz Go

Implementação do desafio feita (quase que) 100% em Golang

Minha intenção é aprimorar meus conhecimentos em arquitetura de software, desenvolvimento e solução de problemas com recursos limitados.
\*Nota: Golang (ainda) não é minha linguagem de programação principal, o que tornou o desafio muito interessante para aprender e me familiarizar mais com o ecosistema da linguagem

## Abordagem para processamento dos pagamentos

Apelidei minhas instâncias de API carinhosamente de "Proxy", elas apenas processam a requisição HTTP e publicam em uma stream de Redis (no caso, KeyDB) chamado de "Broker"
Essa stream é então consumida por 3 instâncias de Workers, que criam um grupo de consumidor para sí próprio, fazendo com que o KeyDB balanceie automaticamente para os 3 grupos.

Cada worker pega uma mensagem do Broker e, utilizando variáveis de ambiente, detectam quais serviços estão disponíveis para aceitar o pagamento.
Os workers mantém uma variável de controle independente, porém, no KeyDB também é armazenado um valor timestamp com a ultima requisição feita para cada serviço de pagamento, evitando um timeout eterno com a regra dos 5s.

Caso ambos estejam fora de serviço, a mensagem é adicionada de volta na stream com os mesmos valores e ID's para ser processada novamente.
Caso o pagamento seja realizado, as chaves contendo a quantidade total e o valor total do payments que foi realizada a transação no serão atualizadas no KeyDB (ou seja, ele também é "banco de dados")

## Tecnologias utilizadas

- **Linguagem:** Go
- **Armazenamento:** KeyDB
- **Gerenciamento de filas e workers:** Programados do zero em Go
- **Balanceamento de carga:** Nginx

## Código fonte

<https://github.com/mourishitz/go-rinha-de-backend>
