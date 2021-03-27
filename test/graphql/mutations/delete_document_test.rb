require 'test_helper'

class Mutations::DelecteDocumentTest < ActiveSupport::TestCase
  def perform(**args)
    current_user = User.create(name: 'Sergio', email: 'sergio@fab.mil.br', password: '1234')
    current_user.reload
    Mutations::DeleteDocument.new(
      object: nil,
      field: { name: 'DeleteDocument' },
      context: { current_user: current_user }
    ).resolve(args)
  end

  test 'delete a document' do
    document = Document.find 1
    perform({ document_id: 1 })

    assert_raises ActiveRecord::RecordNotFound do
      document.reload
    end
  end
end
