require 'test_helper'
 
class UserFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create({ :username => "Meow2", :email => "meow2@meow.com", :password => "1234", :password_confirmation => Devise::Encryptor.digest(User,"1234"), birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 })
  end


  test "signed in user is redirected to root" do
    get user_session_path
    assert_equal 200, status

    post user_session_path, user: { 'user[email]' => @user.email, 'user[password]' => @user.encrypted_password }
    assert_equal 200, status
    
  end

  # test "login and browse site" do
    
  #   sign_in users(:meow1)

  #   assert_equal '/dashboard', path
  #   assert_response :success
  #   assert_equal 'Signed in successfully.', flash[:notice]
 
  #   get "/users"
  #   assert_response :success
  #   assert assigns(:users)
  # end
end