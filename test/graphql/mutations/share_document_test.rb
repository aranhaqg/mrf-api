require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  def perform(user, **args)
    Mutations::ShareDocument.new(
      object: nil,
      field: { name: 'ShareDocument' },
      context: { current_user: user }
    ).resolve(args)
  end

  test 'share a document with a user' do
    current_user = User.create(name: 'Paulo', email: 'paulo@fab.mil.br', password: '1234')
    current_user.reload

    document_sharing = perform(
      current_user,
      { user_id: current_user.id, document_id: 1 }
    )

    assert document_sharing[:document_sharing].id.present?
    assert_equal document_sharing[:document_sharing].user_id, current_user.id
    assert_equal document_sharing[:document_sharing].document_id, 1
    assert_equal document_sharing[:document_sharing].created_by_user, false
  end
end
