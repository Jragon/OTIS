require 'spec_helper'

describe Conversation do
  describe 'Associations' do
    it { should belong_to :discussion }
    it { should belong_to :change }
    it { should have_many :fruit }
  end

  describe 'Validations' do
    it { should validate_presence_of :discussion_id }
    it { should validate_presence_of :change_id }
    it { should validate_presence_of :rank }
    it { should validate_presence_of :ten_seed }
  end
end
