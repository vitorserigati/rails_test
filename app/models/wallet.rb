class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates :user_id, presence: true, uniqueness: true

  after_create :save
end
