class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :favoritee_id, index: true
      t.integer :favoriter_id
      t.timestamps 
    end
  end
end
