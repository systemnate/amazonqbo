class Configuration < ActiveRecord::Base
  belongs_to :user

  validates :primary_marketplace_id, presence: true, length: { minimum: 5, maximum: 100 }
  validates :merchant_id, presence: true, length: { minimum: 5, maximum: 100 }
  validates :auth_token, presence: true, length: { minimum: 5, maximum: 100 }
end
