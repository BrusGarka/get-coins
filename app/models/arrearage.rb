class Arrearage < ApplicationRecord

  belongs_to :user
  belongs_to :receiver

  has_many :installments

  validates_presence_of :payment_type, :category, :title, :description, :total_value, :installment_number, :pay_at

  after_create :build_installments
  after_update :update_installment_value, if: 'self.is_monthly'

  enum category: [:normal,:monthly]
  enum payment_type: [:credit_card, :transfer, :in_cash, :bank_slip]

  def build_installments
    date = self.pay_at
    installment_value = (self.total_value/self.installment_number).round(2)
    (1..self.installment_number).each do |i|
      self.installments.create!(mumber: i, value: installment_value, pay_at: date)
      date = date + 1.month
    end
  end

  def is_monthly?
    self.category == :monthly
  end

  def is_normal?
    self.category == :normal
  end

  def update_installment_value
    pending_installments = self.installments.where(payd: false).where("pay_at > #{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}")
    pending_installments.update_all(value: self.value)
  end




end
