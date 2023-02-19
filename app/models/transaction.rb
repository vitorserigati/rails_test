class Transaction < ApplicationRecord
  belongs_to :wallet

  validates :amount, :type, presence: true
end
