# Ateliê Garni

Sistema web de gestão de comandas para cafeterias. Permite abrir comandas por mesa, lançar produtos, fechar a conta com a forma de pagamento e acompanhar as vendas em um painel de indicadores.

Projeto fullstack construído do zero, com foco em boas práticas de backend, modelagem de banco de dados e infraestrutura com Docker.

> **Status:** em desenvolvimento.

## Funcionalidades

- **Comandas**: abrir, lançar itens, acompanhar as comandas em aberto e fechar com forma de pagamento
- **Produtos**: cadastro com categoria, preço e controle de disponibilidade
- **Analytics**: receita total, ticket médio, comandas fechadas, produtos vendidos e receita por dia, com filtros de período e forma de pagamento
- **Autenticação**: login com perfis de acesso (administrador e atendente)


## Tecnologias

| Camada | Tecnologia |
|---|---|
| Backend | Java 21, Spring Boot, Spring Data JPA, Spring Security |
| Banco de dados | PostgreSQL, Flyway |
| Frontend | React, Vite |
| Infraestrutura | Docker, Docker Compose |

## Destaques técnicos

- API REST em camadas (controller, service, repository)
- Banco versionado com migrations
- Preço do produto copiado para o item no momento da venda, preservando o histórico financeiro quando os preços mudam
- Valores monetários com `BigDecimal` e `NUMERIC`, evitando erros de arredondamento
- Senhas armazenadas com hash BCrypt e autenticação com JWT
- Ambiente containerizado com Docker Compose

## Modelo de dados

```
usuario ──< comanda >── pagamento
               │
               └──< item_comanda >── produto
```

Cinco tabelas: `usuario`, `produto`, `pagamento`, `comanda` e `item_comanda`.


## Roadmap

- [x] Protótipo das telas
- [x] Modelagem do banco de dados
- [x] Banco PostgreSQL com Docker Compose
- [ ] Migrations com Flyway
- [ ] API de produtos
- [ ] API de comandas
- [ ] API de analytics
- [ ] Autenticação com JWT
- [ ] Interface web
- [ ] Docker Compose completo (banco, backend e frontend)
- [ ] Testes automatizados e CI com GitHub Actions