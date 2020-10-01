module Mutations
  class ShareDocument < BaseMutation
    # arguments passed to the `resolve` method
    argument :document_id, Integer, required: true
    argument :user_id, Integer, required: true

    # return type from the mutation
    field :document_sharing, Types::UserType, null: false

    def resolve(document_id: nil, user_id: nil)
      document_sharing = DocumentSharing.create!(
        user_id: user_id,
        document_id: document_id,
      )
      { document_sharing: document_sharing }
    end
  end
end