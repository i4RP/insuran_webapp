class User < ApplicationRecord
  has_many :votes
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def eth
    # TODO: EthereumNetworkからETH数を取得する。
    '1000000'
  end
end
