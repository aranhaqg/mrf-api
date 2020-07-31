module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_documents, [DocumentType], null: false,
      description: "Return all documents"
    def all_documents
      Document.all
    end
  end
end
