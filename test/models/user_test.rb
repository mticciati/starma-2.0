require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

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

    u = users(:meow)
    assert u.save, "Failed to save perfectly good user: #{u.errors.full_messages.inspect }"
  
  end

end
