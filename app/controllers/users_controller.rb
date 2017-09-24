class UsersController < ApplicationController
  before_action :sign_in_required, only: [ :show ]

  def index
    #code
  end

  def show
    if current_user.ethereum_wallet_address.present?
      @user_wei = Forms::UserWallet.balance_of(current_user.ethereum_wallet_address)
    end

  end
end
