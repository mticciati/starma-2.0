class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.integer :favorite_user_id, null: false 
      t.timestamps null: false
    end
  end
end
