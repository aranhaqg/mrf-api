require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    response = perform(
      name: 'Test User',
      auth_provider: {
        credentials: {
          email: 'email@fab.mil.br',
          password: '[omitted]'
        }
      }
    )

    assert response[:user].id.present?
    assert_equal response[:user].name, 'Test User'
    assert_equal response[:user].email, 'email@fab.mil.br'
  end
end
