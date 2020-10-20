# MRF API

Esta é uma API em GraphQL para criação de documentos de MRF (Minuta de Relatório Final) que são utilizados em investigações de acidentes aéreos.

Esta API usa:

* Ruby versão 2.7.1
* Rails 6.0.3
* PostgreSQL 12.4
* GraphQL 1.9.17

Para mais detalhes olhe [Gemfile](Gemfile).

## Exemplos de mutations 
### Sign in Admin (logar na API)
```json
mutation {
  signinUser(input: {
    credentials: {
      email: "admin@mrf.com",
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
### Create User (criar novo usuário)
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

## Exemplos de Queries
```json
{
  allDocuments{
    id
    body
    createdBy {
      id
      name
      email
    }
  }
}

```





