class CreateCustomChartData < ActiveRecord::Migration
  def change
    create_table :custom_chart_data do |t|
      t.belongs_to :user, index: true
      t.string :birth_place
      t.string :birth_time
      t.float :birth_latitude
      t.float :birth_longitude
      t.boolean :time_unknown
      t.integer :time_interval
      t.boolean :dst

      t.timestamps 
    end
  end
end
