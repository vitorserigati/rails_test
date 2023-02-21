class Transaction < ApplicationRecord
  belongs_to :from_wallet, class_name: 'Wallet', foreign_key: 'from_wallet_id'
  belongs_to :to_wallet, class_name: 'Wallet', foreign_key: 'to_wallet_id'

  validates :amount, presence: true, numericality: true
  validates :from_wallet, :to_wallet, presence: true
end
