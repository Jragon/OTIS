class Village < ActiveRecord::Base
  before_validation { |village| village.name.capitalize! }

  belongs_to :programme
  has_many :discussions, dependent: :destroy
  has_many :conversations, through: :discussions
  has_many :groups, through: :discussions
  has_many :changes, through: :conversations

  validates :name, :programme_id, presence: true
  validates :name, uniqueness: { scope: :programme_id } 
  
  def top_change
    changes.merge(Change.top(false)).take
  end

  def changes_with_score
    changes.merge Change.with_ten_seed.top
  end
end
