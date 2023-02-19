class Wallet < ApplicationRecord
  belongs_to :User
  has_many :transactions
end
