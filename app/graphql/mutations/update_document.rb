module Mutations
  class UpdateDocument < BaseMutation
    include AuthenticableApiUser
    # arguments passed to the `resolve` method
    argument :document_id, Integer, required: true
    argument :document_body, String, required: true

    # return type from the mutation
    field :document, Types::DocumentType, null: false

    def resolve(document_id: nil, document_body: nil)
      ready?

      @document = Document.find document_id

      return GraphQL::ExecutionError.new("You don't have access to this document") if @document.is_accessible_by_user(context[:current_user].id)

      @document.update(body: document_body)

      { document: @document }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
