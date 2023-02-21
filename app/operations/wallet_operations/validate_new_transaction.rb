class WalletOperations::ValidateNewTransaction
  def initialize(amount:, to_wallet:, from_wallet:)
    @amount = amount
    @to_wallet = Wallet.where(id: to_wallet).first
    @from_wallet = Wallet.where(id: from_wallet).first
    @errors = []
  end

  def execute!
    validate_existance_of_wallet!
    validate_transfer if @from_wallet.present? && @to_wallet.present?
    @errors
  end

  private

  def validate_transfer
    return unless @from_wallet.balance - @amount < 0.00

    @errors << 'Not enough funds'
  end

  def validate_existance_of_wallet!
    if @from_wallet.blank?
      @errors << 'Sender wallet not found'
    elsif @to_wallet.blank?
      @errors << 'Destiny wallet not found'
    end
  end
end
