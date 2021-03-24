require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  def perform(**args)
    Mutations::CreateDocument.new(
      object: nil,
      field: { name: 'CreateDocument' },
      context: { current_user: users(:user_one) }
    ).resolve(args)
  end

  test 'create a new document' do
    response = perform(
      body: 'body'
    )

    assert response[:document].id.present?
    assert_equal response[:document].body, 'body'
    assert response[:document_sharing].document_id.present?
  end
end
