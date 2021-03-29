module Mutations
  class CreateDocument < BaseMutation
    include AuthenticableApiUser
    # arguments passed to the `resolve` method
    argument :body, String, required: true

    # return type from the mutation
    field :document, Types::DocumentType, null: false
    field :document_sharing, Types::DocumentSharingType, null: false

    def resolve(body: nil)
      ready?
      @document = Document.create!(
        body: body
      )

      document_id = @document.id
      @document_sharing = DocumentSharing.create!(
        document_id: document_id,
        user_id: context[:current_user].id,
        created_by_user: true
      )
      { document: @document, document_sharing: @document_sharing }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
