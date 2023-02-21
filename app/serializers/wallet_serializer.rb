class WalletSerializer < ActiveModel::Serializer
  attributes :id, :balance
  belongs_to :user

  has_many :outgoing_transactions, serializer: TransactionSerializer do
    object.outgoing_transactions.order(created_at: :desc)
  end
  has_many :incoming_transactions, serializer: TransactionSerializer do
    object.incoming_transactions.order(created_at: :desc)
  end
end
