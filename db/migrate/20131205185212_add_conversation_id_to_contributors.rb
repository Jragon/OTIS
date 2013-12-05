class AddConversationIdToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :conversation_id, :integer
  end
end
