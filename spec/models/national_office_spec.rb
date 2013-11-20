require 'spec_helper'

describe NationalOffice do
  describe 'Associations' do
    it { should belong_to :regional_office }
    it { should have_many :programmes }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :regional_office_id }
  end
end
