module Types
  class QueryType < Types::BaseObject
    include AuthenticableApiUser

    field :all_documents, [DocumentType], null: false,
      description: "Return all documents"
    def all_documents
      ready?
      Document.joins(:document_sharings)
              .where(document_sharings: { user_id: context[:current_user].id})
    end

    field :all_document_sharings, [DocumentSharingType], null: false,
      description: "Return all document sharings"
    def all_document_sharings
      ready?
      DocumentSharing.all
    end
  end
end
