class MonthlyIncome < ApplicationRecord

  belongs_to :user

  enum month: [:januany,:february,:march,:april, :may, :june, :july, :august, :september, :october, :november, :december]

  validates_presence_of  :value

  def build_all_months(user, value)
    (0..11).each do |i|
      user.monthly_incomes.create!(month: i, value: value)
    end
  end

end
