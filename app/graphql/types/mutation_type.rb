module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_document, mutation: Mutations::CreateDocument
    field :signin_user, mutation: Mutations::SignInUser
    field :share_document, mutation: Mutations::ShareDocument
    field :delete_document, mutation: Mutations::DeleteDocument
    field :export_document, mutation: Mutations::ExportDocument
  end
end
