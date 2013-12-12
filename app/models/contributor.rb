class Contributor < ActiveRecord::Base
  acts_as_list column: :rank, scope: :conversation

  belongs_to :conversation

  validates :conversation_id, :name, :rank, presence: true
  validates :name, :rank, uniqueness: { scope: :conversation_id } 
end
