class CreateVedicCharts < ActiveRecord::Migration
  def change
    create_table :vedic_charts do |t|
      t.belongs_to :user, index: true
      t.integer :house
      t.string :sign
      t.string :type

      t.timestamps null: false
    end
  end
end
