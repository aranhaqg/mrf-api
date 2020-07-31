require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateDocument.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new document' do
    document = perform(
      body: 'body',
      user: User.first,
    )

    assert document.persisted?
    assert_equal document.body, 'body'
  end
end