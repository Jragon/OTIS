class Conversation < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :change
  has_many :fruit, dependent: :destroy
  has_many :threats, dependent: :destroy
  has_many :contributors, dependent: :destroy 
  has_many :themes, dependent: :destroy

  validates :discussion_id, :change_id, :rank, :ten_seed, presence: true
  validates :change_id, :rank, uniqueness: { scope: :discussion_id } 

  acts_as_list column: :rank, scope: :discussion

  def change_name
    change.try(:name)
  end

  def change_name= name
    self.change = Change.find_or_create_by(name: name) if name.present?
  end
end
