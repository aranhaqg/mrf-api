require 'test_helper'

class Mutations::CreateDocumentTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateDocument.new(object: nil, field: nil, context: { current_user: user }).resolve(args)
  end

  test 'create a new document' do
    user = users(:user_one)
    
    document = perform(
      user: user,
      body: 'body'
    )

    assert document[:document].id.present?
    assert_equal document[:document].body, 'body'
  end
end