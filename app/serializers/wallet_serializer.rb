class WalletSerializer < ActiveModel::Serializer
  attributes :id, :balance
  belongs_to :user

  has_many :transactions
end
