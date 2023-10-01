class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties, dependent: :destroy
  has_one :wallet, dependent: :destroy

  enum :role, { admin: 0, user: 1 }

  after_create_commit :create_user_wallet

  def create_user_wallet
    self.create_wallet
  end
end
