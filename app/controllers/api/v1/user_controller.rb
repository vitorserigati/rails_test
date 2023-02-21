class Api::V1::UserController < ApplicationController
  before_action :authenticate_api_user!

  def index
    @users = User.all
    list = []
    @users.each { |user| list << format_user_info(user) if user != current_api_user }

    render json: list
  end

  def show
    @user = format_user_info(User.find(params[:id]))
    render json: @user
  end

  private

  def format_user_info(user)
    { id: user.id, first_name: user.first_name, middle_name: user.middle_name, last_name: user.last_name,
      wallet: { id: user.wallet.id } }
  end
end
