class Wallet < ApplicationRecord
  belongs_to :user
  has_many :outgoing_transactions, class_name: 'Transaction', foreign_key: 'from_wallet_id'
  has_many :incoming_transactions, class_name: 'Transaction', foreign_key: 'to_wallet_id'
  validates :user_id, presence: true, uniqueness: true
end
