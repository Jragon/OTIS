class Change < ActiveRecord::Base
  has_many :conversations

  validates :name, presence: true
end