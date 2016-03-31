class Messages < ActiveRecord::Migration
  def change
    create_table(:messages) do |t|
      t.integer :to_user_id, null: false
      t.integer :from_user_id, null: false
      t.string :body, null: false
    end
  end
end
