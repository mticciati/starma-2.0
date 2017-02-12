class Favorite < ActiveRecord::Base
  belongs_to :favorite_user, foreign_key: "favorite_user_id", class_name: "User"
end
