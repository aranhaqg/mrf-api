require "pdfkit"

module Mutations
  class ExportDocument < BaseMutation
    # arguments passed to the `resolve` method
    argument :document_id, Integer, required: true

    # return type from the mutation
    field :pdf_url, String, null: false

    def resolve(document_id: nil)
      document = Document.find(document_id)
      
      { pdf_url: document.pdf_url }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end