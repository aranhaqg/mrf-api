module Mutations
  class DeleteDocument < BaseMutation
    # arguments passed to the `resolve` method
    argument :document_id, Integer, required: true

    # return type from the mutation
    field :is_deleted, Boolean, null: false

    def resolve(document_id: nil)
      delete_document = Document.find(
        document_id
      )
      { is_deleted: delete_document.destroy }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end