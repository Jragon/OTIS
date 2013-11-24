class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.integer :conversation_id
      t.integer :rank
      t.integer :ten_seed
      t.text :observations

      t.timestamps
    end
  end
end
