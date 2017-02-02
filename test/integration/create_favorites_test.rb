require 'test_helper'

class CreateFavoritesTest < ActionDispatch::IntegrationTest
  
  test 'create new favorite'
    
    get create_favorite_path

  end

end
