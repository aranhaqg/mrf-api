require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valite only FAB emails" do
    invalid_user = User.new
    invalid_user.email = 'user1@gmail.com'
    invalid_user.password = '123456'
    invalid_user.name = 'User 1'
    
    valid_user = User.new
    valid_user.email = 'user2@fab.mil.br'
    valid_user.password = '123456'
    valid_user.name = 'User 2'
    
    assert_not invalid_user.save
    assert valid_user.save
  end
end
