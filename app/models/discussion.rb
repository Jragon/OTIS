class Discussion < ActiveRecord::Base
  belongs_to :village
  belongs_to :group
end
