class Forms::Verify < Forms::ContractBase
  class << self
    def verify_contract
      Ethereum::Contract.create(
        client: self.ethereum_client,
        name: 'Verify',
        address: ENV['VERIFY_ADDRESS'],
        abi: '[{"constant":false,"inputs":[],"name":"verifyContractOwner","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_userAddress","type":"address"}],"name":"subscribe","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_amount","type":"uint256"}],"name":"execUserWalletTransfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_amount","type":"uint256"}],"name":"execTransfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_amount","type":"uint256"}],"name":"execSendChargeToOwner","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"userWalletContract","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"subscribeAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_userWalletAddr","type":"address"}],"name":"setUserWalletContract","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"}]'
      )
    end

    def exec_transfer(user_address, amount_eth)
      contract = self.verify_contract
      amount_wei = self.from_eth_to_wei(amount_eth)
      contract.transact.exec_transfer(user_address, amount_wei)
    end
  end
end
