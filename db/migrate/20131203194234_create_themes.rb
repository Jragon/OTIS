class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :conversation_id

      t.timestamps
    end
  end
end
