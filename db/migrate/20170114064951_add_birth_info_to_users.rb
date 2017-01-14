class AddBirthInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_place, :string
    add_column :users, :birth_latitude, :float
    add_column :users, :birth_longitude, :float
    add_column :users, :time_unknown, :boolean
    add_column :users, :time_interval, :integer
    add_column :users, :dst, :boolean
  end
end
