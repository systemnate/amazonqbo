class AmazonStatement < ActiveRecord::Base
  belongs_to :user

  validates :period, presence: true
  validates :deposit_total, presence: true
  validates :status, presence: true
  validates :deposit_total, numericality: true
end
