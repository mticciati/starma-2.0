class AddBirthdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :date, default: "0000:00:00"
  end
end
