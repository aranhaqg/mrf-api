module Types
  class DocumentSharingType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :document, Types::DocumentType, null: false
    field :created_by_user, Boolean, null: false
  end
end
