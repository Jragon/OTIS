class Group < ActiveRecord::Base
  before_save { |group| group.name.capitalize! }

  has_many :discussions
  has_many :conversations, through: :discussions
  has_many :changes, through: :conversations

  validates :name, presence: true, uniqueness: true
end
