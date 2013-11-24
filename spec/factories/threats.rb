# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :threat do
    name "MyString"
    rank "MyString"
    observations "MyText"
  end
end
