class AddConversationIdToThreats < ActiveRecord::Migration
  def change
    add_column :threats, :conversation_id, :integer
  end
end
