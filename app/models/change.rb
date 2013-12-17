class Change < ActiveRecord::Base
  before_validation { |change| change.name.capitalize! }

  has_many :conversations, dependent: :destroy
  has_many :discussions, through: :conversations 
  has_many :groups, through: :discussions
   
  validates :name, presence: true, uniqueness: true


   
  def self.top_ranked(options = {})
    top.limit(1).first
  end

  def self.top(options = {})
    with_rank(options).order("score desc")
  end

  def self.with_rank(options = {})
    select("changes.*, ROUND((AVG(11 - conversations.rank) + COUNT(conversations.id)), 1) as score").group(options[:group_by] ? options[:group_by] : "changes.id").joins(:conversations)
  end

  def self.with_ten_seed(options = {})
    select("changes.*, ROUND(AVG(conversations.ten_seed), 1) as average_ten_seed").group("changes.id").joins(:conversations)
  end
end