class CreateMessages < ActiveRecord::Migration
  def change
    create_table(:messages) do |t|

      t.belongs_to :conversation, index: true
      t.belongs_to :user, index: true
      t.string :body, null: false
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
