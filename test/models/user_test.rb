require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "first test" do 
  
    user = User.new
    assert_equal "foo", user.foo

  end

end
