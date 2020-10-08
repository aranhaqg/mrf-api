module Types
  class DocumentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
  end
end
