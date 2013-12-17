class Change < ActiveRecord::Base
  before_validation { |change| change.name.capitalize! }

  has_many :conversations, dependent: :destroy
  has_many :discussions, through: :conversations 
   
  validates :name, presence: true, uniqueness: true


   
  def self.top_ranked(load_conversation=true)
    top.limit(1).first
  end

  def self.top(load_conversation=true)
    with_rank(load_conversation).order("score desc")
  end

  def self.with_rank(load_conversation=true)
    q = select("changes.*, ROUND((AVG(11 - conversations.rank) + COUNT(conversations.id)), 1) as score").group("changes.id")
    q = q.joins(:conversations) if load_conversation
    return q
  end

  def self.with_ten_seed(load_conversation=true)
    q = select("changes.*, ROUND(AVG(conversations.ten_seed), 1) as average_ten_seed").group("changes.id")
    q = q.joins(:conversations) if load_conversation
    return q
  end
end