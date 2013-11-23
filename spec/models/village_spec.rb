require 'spec_helper'

describe Village do
  describe 'Associations' do
    it { should belong_to :programme }
    it { should have_many :discussions }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :programme_id }
  end
end
