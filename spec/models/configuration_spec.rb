require "rails_helper"

describe Configuration, type: :model do
  it { should validate_presence_of :primary_marketplace_id }
  it { should validate_presence_of :merchant_id }
  it { should validate_presence_of :auth_token }
end
