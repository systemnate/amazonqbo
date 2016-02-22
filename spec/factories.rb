FactoryGirl.define do
  factory :amazon_statement do
    period "MyString"
    beginning_balance "9.99"
    product_charges "9.99"
    promo_rebates "9.99"
    amazon_fees "9.99"
    other "9.99"
    deposit_total "9.99"
    status "MyString"
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
