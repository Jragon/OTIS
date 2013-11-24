class Fruit < ActiveRecord::Base
  belongs_to :conversation

  validates :conversation_id, :rank, :ten_seed, presence: true
end
