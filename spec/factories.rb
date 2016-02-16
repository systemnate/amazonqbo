FactoryGirl.define do
  factory :configuration do
    primary_marketplace_id "MyString"
    merchant_id "MyString"
    auth_token "MyString"
    user nil
  end
  factory :user do
    email "testuser@example.com"
    password "password"
  end
end
