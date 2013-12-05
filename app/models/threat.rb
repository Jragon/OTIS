class Threat < ActiveRecord::Base
  belongs_to :conversation

  validates :conversation_id, :name, :rank, presence: true
  validates :name, :rank, uniqueness: { scope: :conversation_id } 
end