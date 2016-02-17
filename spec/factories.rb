FactoryGirl.define do
  factory :user do
    name "John Smith"
    email FFaker::Internet.email
    password "password"
  end

  factory :configuration do
    primary_marketplace_id "primary_marketplace_id"
    merchant_id "merchant_id"
    auth_token "auth_token"
  end
end
