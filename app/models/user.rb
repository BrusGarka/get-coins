class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    include Authenticatable

    has_many :arrearages
    has_many :receivers
    has_many :monthly_incomes


    def self.authentication_keys
      [:email]
    end

end
