require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::ShareDocument.new(
      object: nil, 
      field: { name: 'ShareDocument' }, 
      context: { current_user: users(:user_one) }
    ).resolve(args)
  end

  test 'share a document with a user' do
    document_sharing = perform(
      user_id: 1,
      document_id: 1,
    )
    
    assert document_sharing[:document_sharing].id.present?
    assert_equal document_sharing[:document_sharing].user_id, 1
    assert_equal document_sharing[:document_sharing].document_id, 1
    assert_equal document_sharing[:document_sharing].created_by_user, false
  end
end