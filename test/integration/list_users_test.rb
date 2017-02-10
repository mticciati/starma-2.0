require 'test_helper'

class ListUsersTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create({ :username => "Meow2", :email => "meow2@meow.com", :password => "1234", :password_confirmation => Devise::Encryptor.digest(User,"1234"), birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 })
    @admin = User.create({ :username => "Meow2", :email => "meow2@meow.com", :password => "1234", :password_confirmation => Devise::Encryptor.digest(User,"1234"), birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419, role: "admin" })
  end

  # test "redirect on destroy if not admin" do
  #   assert_no_difference 'User.count' do 
  #     delete user: { 'username' => 'Meow2' }
  #   end
  # end

end