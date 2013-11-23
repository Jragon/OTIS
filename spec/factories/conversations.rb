# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
    discussion_id 1
    change_id 1
    rank 1
    ten_seed 1
    observations "MyString"
  end
end
