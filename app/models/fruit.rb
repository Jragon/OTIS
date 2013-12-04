class Fruit < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :theme
  has_many :threats, dependent: :destroy
  has_many :contributors, dependent: :destroy

  validates :conversation_id, :name, :rank, :ten_seed, presence: true

  acts_as_list column: :rank, scope: :conversation

  def theme_name
    theme.try(:name)
  end

  def theme_name= name
    self.theme = Theme.find_or_create_by(name: name) if name.present?
    self.theme.conversation_id = self.conversation_id
  end
end
