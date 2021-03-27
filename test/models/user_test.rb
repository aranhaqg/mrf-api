require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valite only FAB emails" do
    invalid_user = User.new
    invalid_user.email = 'leticia@gmail.com'
    invalid_user.password = '123456'
    invalid_user.name = 'Leticia'

    valid_user = User.new
    valid_user.email = 'tarcisio@fab.mil.br'
    valid_user.password = '123456'
    valid_user.name = 'Tarcisio'

    assert_not invalid_user.save
    assert valid_user.save
  end
end
