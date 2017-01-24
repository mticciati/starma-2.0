class CreatePoiPositions < ActiveRecord::Migration
  def change
    create_table :poi_positions do |t|
      t.references :vedic_chart, polymorphic: true, index: true
      t.references :western_chart, polymorphic: true, index: true
      t.string :poi
      t.float :coordinates
      t.integer :house

      t.timestamps null: false
    end
  end
end
