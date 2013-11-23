class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :discussion_id
      t.integer :change_id
      t.integer :rank
      t.integer :ten_seed
      t.string :observations

      t.timestamps
    end
  end
end
