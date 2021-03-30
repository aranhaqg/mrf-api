module Mutations
    class ExportDocument < BaseMutation
      include AuthenticableApiUser
      
      # arguments passed to the `resolve` method
      argument :document_id, Integer, required: true
  
      # return type from the mutation
      field :public_url, Boolean, null: false
  
      def resolve(document_id: nil)
        ready?
        document = Document.find(
          document_id
        )
        { public_url: document.pdf_url }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end