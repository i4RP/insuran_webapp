class BuyInsesController < ApplicationController
  before_action :sign_in_required

  def new
    @buy_ins = Forms::BuyIns.new
    # TODO: 現在集まっているINSとユーザが保有しているINSを取得するロジックを追加する事。
    @collecting_ins_num = 10000
    @hold_ins_num = 100
  end

  def create
    @buy_ins = Forms::BuyIns.new(permit_params)
    # TODO: EthereumNetworkでトランザクションを生成するロジックを追加する事。

    flash[:notice] = '購入処理が成功しました。'
    redirect_to user_path(current_user)
  end

  private

  def permit_params
    params.required(:forms_buy_ins).permit(:ethereum_wallet_address, :secret_key, :buy_ins_num)
  end
end
