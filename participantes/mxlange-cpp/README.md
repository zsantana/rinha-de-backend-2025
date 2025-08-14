# Rinha de Backend 2025

## Repositório

[https://github.com/MXLange/rinha-cpp](https://github.com/MXLange/rinha-cpp)

## Projeto

A escolha da linguagem **C++** decorreu de um desafio pessoal, pegar uma linguagem que não tenho familiaridade e entregar algo funcional.

A aplicação foi construída com foco em utilizar uma linguagem mais próxima à máquina.

---

### 🧠 Arquitetura da Solução

-   **Fila de pagamentos em memória:**  
    Em vez de usar Redis ou outros intermediários, utilizei uma lista em memória.

-   **Workers**  
    Cada instãncia tem seu worker.

-   **Resumo distribuído dos pagamentos:**  
    O estado dos pagamentos é mantido em memória. Para calcular o total agregado, cada instância da API consulta diretamente a outra via HTTP, somando os valores locais com os remotos.

---

### ⚙️ Tecnologias e escolhas

-   **C++**
-   Concorrência com threads.
-   Comunicação entre instâncias via HTTP
-   Armazenamento e agregação em memória.
