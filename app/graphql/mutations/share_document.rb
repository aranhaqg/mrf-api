module Mutations
  class ShareDocument < BaseMutation
    # arguments passed to the `resolve` method
    argument :user_id, Integer, required: true
    argument :document_id, Integer, required: true

    # return type from the mutation
    field :document_sharing, Types::DocumentSharingType, null: false

    def resolve(document_id: nil, user_id: nil)
      document_sharing = DocumentSharing.create!(
        user_id: user_id,
        document_id: document_id,
      )
      { document_sharing: document_sharing }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end