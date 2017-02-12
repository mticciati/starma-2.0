class CreateWesternCharts < ActiveRecord::Migration
  def change
    create_table :western_charts do |t|
      t.belongs_to :user, index: true
      t.integer :house
      t.string :sign
      t.string :type

      t.timestamps 
    end
  end
end
