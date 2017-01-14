class CreateWesternCharts < ActiveRecord::Migration
  def change
    create_table :western_charts do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :house
      t.string :sign
      t.string :type

      t.timestamps null: false
    end
  end
end
