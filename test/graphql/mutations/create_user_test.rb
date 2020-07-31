require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    user = perform(
      name: 'Test User',
      auth_provider: {
        credentials: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    assert user[:user].id.present?
    assert_equal user[:user].name, 'Test User'
    assert_equal user[:user].email, 'email@example.com'
  end
end