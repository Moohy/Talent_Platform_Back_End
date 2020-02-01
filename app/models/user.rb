class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_one :role_user
  has_one :role, through: :role_user

  has_many :offers
  has_many :services

  
  validates :username, presence: true, uniqueness: true, length: {maximum: 10}
  
  def role? role
    return false if self.role.nil?
    self.role.title == role
  end
end