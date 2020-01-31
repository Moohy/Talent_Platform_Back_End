class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_one :role_user
  has_one :role, through: :role_user
  
  validates :username, presence: true, uniqueness: true, length: {maximum: 10}
  
  
end
