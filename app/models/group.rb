class Group < ActiveRecord::Base
  has_many :discussions

  validates :name, presence: true
end
