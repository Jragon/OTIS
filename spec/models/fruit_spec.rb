require 'spec_helper'

describe Fruit do
  describe 'Associations' do
    it { should belong_to :conversation }
  end

  describe 'Validations' do
    it { should validate_presence_of :conversation_id }
    it { should validate_presence_of :rank }
    it { should validate_presence_of :ten_seed }
  end
end
