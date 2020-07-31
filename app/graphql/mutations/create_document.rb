module Mutations
  class CreateDocument < BaseMutation
    # arguments passed to the `resolve` method
    argument :body, String, required: true

    # return type from the mutation
    field :document, Types::DocumentType, null: false

    def resolve(body: nil)
      document = Document.create!(
        body: body,
        created_by: User.first,
      )
      { document: document }
    end
  end
end