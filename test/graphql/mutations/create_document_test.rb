require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateDocument.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new document' do
    #User.new(name: 'User', email: 'user@mail.com').save
    document = perform(
      body: 'body',
    )

    assert document[:document].id.present?
    assert_equal document[:document].body, 'body'
  end
end