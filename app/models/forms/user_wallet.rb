class Forms::UserWallet < Forms::ContractBase
  class << self
    def user_wallet_contract
      Ethereum::Contract.create(
        client: self.ethereum_client,
        name: 'UserWallet',
        address: ENV['USER_WALLET_ADDRESS'],
        abi: '[{"constant":false,"inputs":[{"name":"_userAddress","type":"address"},{"name":"_contractAddress","type":"address"}],"name":"unsubscribeFromInsurance","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"verifyContractOwner","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"},{"name":"","type":"uint256"}],"name":"applicants","outputs":[{"name":"userWalletAddress","type":"address"},{"name":"apply","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_amount","type":"uint256"}],"name":"sendChargeToOwner","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"verifyContract","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_contractAddr","type":"address"}],"name":"setVerifyContract","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_userAddress","type":"address"},{"name":"_amount","type":"uint256"}],"name":"transfer","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_userAddress","type":"address"}],"name":"callSubscribe","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"applicantNum","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_userAddress","type":"address"},{"name":"_contractAddress","type":"address"}],"name":"setApplicant","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":false,"name":"from","type":"address"},{"indexed":false,"name":"to","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"Sent","type":"event"}]'
      )
    end

    def balance_of(user_address)
      contract = self.user_wallet_contract
      self.from_wei_to_ether(contract.call.balance_of user_address)
    end

    def set_applicant(user_address)
      contract = self.user_wallet_contract
      contract.transact.set_applicant(user_address, ENV['VERIFY_ADDRESS'])
    end

    def get_applicants_length
      contract = self.user_wallet_contract
      contract.call.applicant_num
    end

    def unsubscribe_from_insurance(user_address)
      contract = self.user_wallet_contract
      contract.transact.unsubscribe_from_insurance(user_address, ENV['VERIFY_ADDRESS'])
    end
  end
end
