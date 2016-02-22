require 'rails_helper'

RSpec.describe AmazonStatement, type: :model do
  it { should validate_presence_of :period }
  it { should validate_presence_of :deposit_total }
  it { should validate_presence_of :status }
  it { should validate_numericality_of :deposit_total }
end
