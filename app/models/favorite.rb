class Favorite < ActiveRecord::Base
  belongs_to :favoriter, foreign_key: "favoriter_id", class_name: "User"
  belongs_to :favoritee, foreign_key: "favoritee_id", class_name: "User"

  def self.find_existing_favorite(favoriter_id, favoritee_id)
    where(favoriter_id: favoriter_id, favoritee_id: favoritee_id).first
  end

end
