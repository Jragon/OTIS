class Group < ActiveRecord::Base
  before_save { |group| group.name.capitalize! }

  has_many :discussions

  validates :name, presence: true, uniqueness: true
end
