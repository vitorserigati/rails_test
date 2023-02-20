class Api::V1::WalletController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_wallet

  def index
    render json: @wallet
  end

  private

  def set_wallet
    @wallet = current_api_user.wallet
  end
end
