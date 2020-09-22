module Types
  class QueryType < Types::BaseObject
  
    field :all_documents, [DocumentType], null: false,
      description: "Return all documents"
    def all_documents
      Document.all
    end

    field :all_document_sharings, [DocumentSharingType], null: false,
      description: "Return all document sharings"
    def all_document_sharings
      DocumentSharing.all
    end
  end
end
