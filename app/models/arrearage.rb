class Arrearage < ApplicationRecord

  belongs_to :user
  belongs_to :receiver

  has_many :installments

  validates_presence_of :payment_type, :category, :title, :description, :total_value, :installment_number, :pay_at

  after_create :build_installments
  after_update :update_installment_value, if: 'self.normal?'

  enum category: [:normal,:monthly]
  enum payment_type: [:credit_card, :transfer, :in_cash, :bank_slip]

  def build_installments
    date = self.pay_at

    installment_value = self.get_installment_value

    (1..self.installment_number).each do |i|
      current_month = (self.pay_at.month) - 1
      self.installments.create!(mumber: i, value: installment_value, pay_at: date, month: current_month, year: date.year)
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
    pending_installments = self.installments.pending
    pending_installments.update_all(value: self.get_installment_updated_value)
  end

  def get_installment_value
    (self.total_value/self.installment_number).round(2)
  end

  def get_installment_updated_value
    return ((self.total_value - self.get_paid_value ) / self.installments.pending.size).round(2)
  end

  def get_paid_value
    self.installments.paid.sum(:value)
  end

  def get_pending_value
    self.installments.pending.sum(:value)
  end




end
