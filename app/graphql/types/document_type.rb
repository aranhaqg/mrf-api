module Types
  class DocumentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :created_by, Types::UserType, null: false
  end
end
