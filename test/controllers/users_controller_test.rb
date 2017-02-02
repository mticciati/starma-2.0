require "test_helper"

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
    sign_in users(:one)
  end

  test "should get index and instantiate users" do
    
    get :index
    assert_response :success
    # assert_not_nil assigns(:users)

  end

  # test "should get update" do
  #   post :update
  #   assert_response :success
  # end

  test "should get show" do
    get(:show, { "id" => @user.id })
    assert_response :success
  end

  # test "index should render correct template and layout" do
  #   get :index
  #   assert_template :index
  #   assert_template layout: "layouts/application"
  # end

  ## TODO find out how to make user/ routes work

  # test "should get show for current user" do 

  #   get :show
  #   assert_response :success
  #   assert_not_nil assigns(:current_user)

  # end 

end