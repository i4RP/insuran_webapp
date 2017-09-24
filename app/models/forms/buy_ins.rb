class Forms::BuyIns
  include ActiveModel::Model

  attr_accessor :ethereum_wallet_address, :secret_key, :buy_ins_num
end
