class MonthlyIncome < ApplicationRecord

  belongs_to :user

  enum month: [:januany,:february,:march,:april, :may, :june, :july, :august, :september, :october, :november, :december]

  validates_presence_of  :value

end
