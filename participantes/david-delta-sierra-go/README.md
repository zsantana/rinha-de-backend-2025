# Projeto
Projeto construido utilizando GO(APIs), e postgres, nginx como LB

# Arquitetura
````aiignore
[HTTP Request]
     ↓
[Controller Handler]
     ↓
[Canal/Fila Interna]
     ↓
[Worker Pool Assíncrono]
     ↓
[Processamento]
````
