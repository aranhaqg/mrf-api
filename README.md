# MRF API

Esta é uma API em GraphQL para criação de documentos de MRF (Minuta de Relatório Final) que são utilizados em investigações de acidentes aéreos.

Esta API usa:

* Ruby versão 2.7.1
* Rails 6.0.3
* PostgreSQL 12.4
* GraphQL 1.9.17

Para mais detalhes olhe [Gemfile](Gemfile).
## Exemplos de mutations
Antes de fazer qualquer mutation ou query é necessário logar com um usuário. O usuário Admin é um usuário padrão criado para o teste da API. O exemplo de signing mutation com este usuário segue abaixo.
### Sign in com usuário Admin (logar na API)
```json
mutation {
  signinUser(input: {
    credentials: {
      email: "admin@fab.mil.br",
      password: "admin"
    }
  }){
    user{
      id
      name
    }
    token
  }
}
```
### Criar usuário (criar novo usuário)
```json
mutation {
  createUser(
    input: {
      name: "Priscila Aranha",
      authProvider: {
        credentials: {
          email: "aranha@mrf.com",
          password: "123456"
        }
      }
    }
  ){
    user{
      id
      name
      email
    }
  }
}
```
### Criar documento MRF (Minuta de Relatório Final)
```json
mutation {
  createDocument(input: { body: "<h1>body</h1>" }){
    document {
      id
    }
    documentSharing {
      id
      user {
        name
      }
      createdByUser
    }
  }
}
```
### Exportar MRF para PDF
```json
mutation {
  createDocument(input: { body: "<h1>Ahoy!</h1>" }){
    document {
      id
    }
    documentSharing {
      id
      user {
        name
      }
      createdByUser
    }
  }
}
```

## Exemplos de Queries
```json
{
  allDocuments{
    id
    body
  }
}

```
