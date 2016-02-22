FactoryGirl.define do
  factory :amazon_statement do
    settlement_id "1234"
    period "MyString"
    deposit_total "9.99"
    status "MyString"
    summary "ABCD"
  end
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
