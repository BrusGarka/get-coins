class Receiver < ApplicationRecord

  belongs_to :user

  enum category: [:credit_card, :internet, :house, :telephone, :family]
end
