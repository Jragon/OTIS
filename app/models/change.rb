class Change < ActiveRecord::Base
  validates :name, presence: true
end