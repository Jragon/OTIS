class Conversation < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :change
  # has_many :fruit

  validates :discussion_id, :change_id, :rank, :ten_seed, presence: true
  validates :change_id, :rank, uniqueness: { scope: :dicussion_id } 
end
