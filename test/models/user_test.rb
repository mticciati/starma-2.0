require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "should have unique email" do 
    @user.save
    @user2 = User.new({ :username => "Test", :email => "test@test.com", :password => "1234", :password_confirmation => "1234", birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 })

    assert_not @user2.valid?
  end

  test "should have unique username" do 
    @user2 = User.new({ :username => "hello123_-E", :email => "test2@test.com", :password => "1234", :password_confirmation => "1234", birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 })

    assert_not @user2.valid?
  end

  test "should not save with bad chars username" do 
    uChars = users(:bad_chars_username)
    assert_not uChars.save, "Uh oh! Username saved with bad chars: #{uChars.errors.full_messages.inspect}"
  end

  test "should not save with long username" do 
    uLong = users(:long_username)
    assert_not uLong.save, "Uh oh! Username saved too long: #{uLong.errors.full_messages.inspect}"
  end

  test "should not save with short username" do 
    uShort = users(:short_username)
    assert_not uShort.save, "Uh oh! Username saved too short: #{uShort.errors.full_messages.inspect}"
  end
 

  test "should not save if under 18" do
    u = users(:under_age)
    assert_not u.save, "Uh oh! Saved under age: #{u.errors.full_messages.inspect}" 
  end

  test "should save when all conditions met" do 

    u = users(:one)
    assert u.save, "Failed to save perfectly good user: #{u.errors.full_messages.inspect }"
  
  end

end
