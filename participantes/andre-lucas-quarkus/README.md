# Rinha backend 2025 - Java + Quarkus + Redis + Virtual Threads

# Tecnologias utilizadas
* Java 21
* Quarkus
* Redis e Redis Streams
* Virtual Threads


# Contexto
Dado o cenário limitado de apenas 1.5 cpu e 350MB entre toda a stack e também de nunca ter usado o quarkus na prática mas ja ter ouvido falar e lido bastante sobre achei ideal para esse cenário.
Podendo compilar a aplicação de forma nativa, e um rapido startup. 
Além disso ter trabalhado com Virtual Threads ajudou muito, ja que em média uma thread é mais cara  ou seja usa mais recurso computacional do que uma  virtual thread. O que é perfeito por receber bastante chamadas HTTP.

O redis usa estruturas de dados otimizadas, utilizado o Quarkus + Mutiny (reactive streams) temos threads não bloqueiam esperando I/O e o CPU fica livre para processamento real

# Repositório official - [link](https://github.com/andrelucasti/payments-quarkuzin-rinha-backend-2025)