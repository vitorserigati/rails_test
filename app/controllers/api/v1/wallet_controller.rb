class Api::V1::WalletController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_wallet

  def index
    render json: @wallet, serializer: WalletSerializer
  end

  def create_transaction
    wallet = find_wallet(params[:to_wallet])
    params[:amount]
    errors = WalletOperations::ValidateNewTransaction.new(from_wallet: @wallet, to_wallet: wallet,
                                                          amount: params[:amount]).execute!
    if errors.empty?
      WalletOperations::PerformTransaction.new(from_wallet: @wallet, to_wallet: wallet,
                                               amount: params[:amount]).execute!
      render json: @wallet, serializer: WalletSerializer
    else
      render json: errors
    end
  end

  private

  def find_wallet(wallet_id)
    Wallet.where(id: wallet_id).first
  end

  def set_wallet
    @wallet = current_api_user.wallet
  end
end
