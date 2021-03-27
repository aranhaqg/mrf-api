require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  def create_user
    @user = User.create(name: 'Jose', email: 'jose@fab.mil.br', password: '1234')
    @user.reload
  end

  def perform(**args)
    Mutations::SignInUser.new(object: nil, field: nil, context: { session: {} }).resolve(args)
  end

  test 'success' do
    create_user
    response = perform(
      credentials: {
        email: @user.email,
        password: @user.password
      }
    )
    assert response[:token].present?
    assert_equal response[:user], @user.reload
  end

  test 'failure because no credentials' do
    assert_equal GraphQL::ExecutionError.new('Invalid input: missing credentials'), perform
  end

  test 'failure because no user found with email' do
    create_user
    assert_equal  GraphQL::ExecutionError.new('User not found'),
                  perform(credentials: { email: 'email', password: '1234' })
  end

  test 'failure because wrong password' do
    create_user
    assert_equal  GraphQL::ExecutionError.new('Invalid input: wrong password'),
                  perform(credentials: { email: @user.email, password: 'wrong' })
  end
end
