class Group < ActiveRecord::Base
  before_validation { |group| group.name.capitalize! }

  has_many :discussions, dependent: :destroy
  has_many :conversations, through: :discussions
  has_many :changes, through: :conversations

  validates :name, presence: true, uniqueness: true

  def top_change
    changes.merge(Change.top(false)).take
  end

  # def changes_with_score_and_ten_seed(village)
  #   changes.merge Change.with_ten_seed.top
  # end

  def changes_with_score(village = false)
    changes.merge Change.with_ten_seed.top(village)    
  end
end
