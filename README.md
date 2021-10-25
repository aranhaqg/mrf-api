# MRF API

Esta é uma API em GraphQL para criação de documentos de MRF (Minuta de Relatório Final) que são utilizados em investigações de acidentes aéreos pelo CENIPA (Centro de Investigação e Prevenção de Acidentes Aeronáuticos).

Esta API usa:

* Ruby versão 2.7.1
* Rails 6.0.3
* PostgreSQL 12.4
* GraphQL 1.9.17

Para mais detalhes olhe [Gemfile](Gemfile).

## Contextualização
Atualmente no CENIPA é utilizado o sistema "Dédalo"  para realizar o  gerenciamento de ocorrências aeronáuticas, investigações, atividades de prevenção, estatísticas e relatórios relacionados ao Sistema de Investigação e Prevenção de Acidentes Aeronáuticos (SIPAER). O Desenvolvimento e evolução são realizados pelos profissionais de TI do CENIPA e Divisão Operacional.

O sistema Eccairs é utilizado como repositório oficial e central entre os órgãos de controle e agências reguladoras (CENIPA, ANAC e DECEA) para registro de RAI (Registro de Ação Inicial).
A elaboração da MRF (Minuta de Relatório Final) é feita localmente entre os membros da comissão de investigação em documentos editáveis (Word) e, após sua finalização, é anexada no Dédalo. 

Durante a investigação os documentos RAI, MRF, MRFS e RFSI não podem ser
redigidos de maneira _on-line_ e de modo colaborativo, tornando a entrega e revisão destes
morosas. Atualmente a elaboração destes documentos consiste em preencher um template, onde
cada membro da comissão de investigação é responsável por uma sessão do documento de
acordo com a sua competência e função na investigação. Para isto, o documento é enviado
manualmente para cada membro da comissão de investigação. Após o fim da contribuição, o
IIC formata e revisa os documentos para, finalmente, anexar ao Sistema de Gestão e Controle
de Eventos Aeronáuticos, Dédalo. Todo o fluxo de aprovação das contribuições e revisões da
MRF já existe no próprio Dédalo.

Segundo relatos de usuários do sistema antigo, o novo programa deveria permitir
a confecção de arquivos na forma final em que serão apresentados, como a MRF, porém
permitindo sua edição de modo _on-line_, cooperativo e integrado, algo ainda mais necessário em
tempos onde o teletrabalho é necessário e estimulado para economia de recursos e por questões
de saúde pública.

Com vistas a estas exigências operacionais, e também considerando a
necessidade de segurança que uma plataforma utilizada na investigação de acidentes
aeronáuticos necessita, este trabalho apresenta um software de código livre que permita a
elaboração on-line de documentos, de forma cooperativa entre os usuários, entregando no final
um documento no formato PDF que atende os requisitos definidos na Norma Padrão de Ação
(NPA) que regula os documentos emitidos pelo CENIPA.
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
Acesse a interface gráfica GraphiQl para ver todas as _mutations_ e _queries_ disponíveis.