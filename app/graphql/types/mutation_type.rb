module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :create_document, mutation: Mutations::CreateDocument
    field :update_document, mutation: Mutations::UpdateDocument
    field :signin_user, mutation: Mutations::SignInUser
    field :signoff_user, mutation: Mutations::SignOffUser
    field :share_document, mutation: Mutations::ShareDocument
    field :delete_document, mutation: Mutations::DeleteDocument
    field :export_document, mutation: Mutations::ExportDocument
  end
end
