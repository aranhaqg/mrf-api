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
    document = perform(
      body: 'body',
    )


    assert document[:document].id.present?
    assert_equal document[:document].body, 'body'
    assert document[:document_sharing].document_id.present?
  end
end