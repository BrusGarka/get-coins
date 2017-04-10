class Receiver < ApplicationRecord

  belongs_to :user

  has_many :arreareages

  enum category: [:credit_card, :internet, :house, :telephone, :family]

  acts_as_paranoid

end
