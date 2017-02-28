class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :fav, :class_name => "User"

  def self.favorite_already_added?(user_id, fav_id)
    where(user_id: user_id, fav_id: fav_id).exists?
  end

  # belongs_to :favoriter, foreign_key: "favoriter_id", class_name: "User"
  # belongs_to :favoritee, foreign_key: "favoritee_id", class_name: "User"

  # def self.favorite_already_added?(favoriter_id, favoritee_id)
  #   where(favoriter_id: favoriter_id, favoritee_id: favoritee_id).exists?
  # end

end
