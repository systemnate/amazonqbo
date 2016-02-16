class Configuration < ActiveRecord::Base
  belongs_to :user

  validates :primary_marketplace_id, presence: true
  validates :merchant_id, presence: true
  validates :auth_token, presence: true
end
