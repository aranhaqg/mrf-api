require 'test_helper'

class Mutations::DelecteDocumentTest < ActiveSupport::TestCase
  def perform(**args)
    Mutations::DeleteDocument.new(
      object: nil,
      field: { name: 'DeleteDocument' },
      context: { current_user: users(:user_one) }
    ).resolve(args)
  end

  test 'delete a document' do
    document = Document.find 1
    perform(
      document_id: 1
    )

    assert_raises ActiveRecord::RecordNotFound do
      document.reload
    end
  end
end
