class Fruit < ActiveRecord::Base
  belongs_to :conversation

  validates :conversation_id, :name, :rank, :ten_seed, presence: true
end
