# MRF API

Esta é uma API em GraphQL para criação de documentos de MRF (Minuta de Relatório Final) que são utilizados em investigações de acidentes aéreos.

Esta API usa:

* Ruby versão 2.7.1
* Rails 6.0.3
* PostgreSQL 12.4
* GraphQL 1.9.17

Para mais detalhes olhe [Gemfile](Gemfile).

## Exemplos de mutations 
### Sign in (logar na API)
```json
mutation {
  signinUser(input: {
    credentials: {
      email: "aranhaqg@gmail.com",
      password: "123456"
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





