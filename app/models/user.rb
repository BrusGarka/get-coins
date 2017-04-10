class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    include Authenticatable

    has_many :arrearages, dependent: :destroy
     has_many :installments, through: :arrearages
    has_many :receivers, dependent: :destroy
    has_many :monthly_incomes, dependent: :destroy

    mount_uploader :picture, AvatarUploader


    acts_as_paranoid


    def self.authentication_keys
      [:email]
    end


  def build_all_months(value)
    (0..11).each do |i|
      self.monthly_incomes.create!(month: i, value: value)
    end
  end

end
