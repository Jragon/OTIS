class Conversation < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :change
  has_many :fruit

  validates :discussion_id, :change_id, :rank, :ten_seed, presence: true
  validates :change_id, :rank, uniqueness: { scope: :discussion_id } 

  def change_name
    change.try(:name)
  end

  def change_name= name
    self.change = Change.find_or_create_by(name: name) if name.present?
  end
end
