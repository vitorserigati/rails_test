class WalletOperations::PerformTransaction
  def initialize(transaction_type:, amount:, to_wallet:, from_wallet:)
    @amount = amount
    @to_wallet = Wallet.where(id: to_wallet).first
    @from_wallet = Wallet.where(id: from_wallet).first
    @transaction_type = transaction_type
  end

  def execute!
    if @transaction_type.eql? 'withdraw'
      Transaction.create!(from_wallet: @from_wallet, amount: @amount)
      @from_wallet.update!(balance: @from_wallet.balance - @amount)
      @from_wallet
    else
      Transaction.create!(from_wallet: @from_wallet, to_wallet: @to_wallet, amount: @amount)
      @from_wallet.update!(balance: @from_wallet.balance - @amount)
      @to_wallet.update!(balance: @to_wallet.balance + @amount)
      @from_wallet
    end
  end
end
