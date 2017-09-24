class Forms::ContractBase
  include ActiveModel::Model

  class << self
    def ethereum_client
      Ethereum::HttpClient.new("http://localhost:8545")
    end

    def transaction_set_user_wallet_address_to_verify
      ethereum_client

      # client.send_transaction({from: "0xa66554db73b40d37d3793bc593ef97ab15c7ca46", to: "0x66bceb5efcebd9ea5cf1d90621b0e9ef6145b70b", value: "5000000000000000000"})
    end

    def from_wei_to_ether(amount)
      formatter = Ethereum::Formatter.new
      formatter.from_wei(amount.to_s)
    end

    def from_eth_to_wei(amount)
      formatter = Ethereum::Formatter.new
      formatter.to_wei(amount.to_i)
    end
  end
end
