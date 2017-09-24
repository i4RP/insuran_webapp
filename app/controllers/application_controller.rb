class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :ethereum_wallet_address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :ethereum_wallet_address])
  end

  def ethereum_client
    @client = Ethereum::HttpClient.new("localhost", "8545")
    # client.send_transaction({from: "0xa66554db73b40d37d3793bc593ef97ab15c7ca46", to: "0x66bceb5efcebd9ea5cf1d90621b0e9ef6145b70b", value: "5000000000000000000"})

  end

  def set_contract_address
    @client_address       = ENV['CLIENT_ADDRESS']
    @user_wallet_address  = ENV['USER_WALLET_ADDRESS']
    @verify_address       = ENV['VERIFY_ADDRESS']
  end
end
