require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  test 'create a new document' do
    current_user = User.create(name: 'Leandro', email: 'leandro@fab.mil.br', password: '1234')
    current_user.reload

    response = Mutations::CreateDocument.new(
      object: nil,
      field: { name: 'CreateDocument' },
      context: { current_user: current_user }
    ).resolve({body: 'body' })

    assert response[:document].id.present?
    assert_equal response[:document].body, 'body'
    assert response[:document_sharing].document_id.present?
  end
end
