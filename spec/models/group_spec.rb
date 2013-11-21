require 'spec_helper'

describe Group do
  describe 'Associations' do
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end
end
