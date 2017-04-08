class Installment < ApplicationRecord

  include Filterable

  belongs_to :arrearage

  validates_presence_of :value, :number, :pay_at

  after_update :update_arrearage_status, if: 'self.paid'
  after_update :update_arrearage_values, if: :value_changed?

  mount_uploader :receipt, AvatarUploader

  def update_arrearage_status
    if self.arrearage.is_normal? and  self.number == self.arrearage.installment_number
      self.arrearage.update!(paid: true)
    end

  end

  def update_arrearage_values
    self.arrearage.update_remaing_installment_values
  end

  def value_changed?
    self.value != self.arrearage.get_installment_value
  end

  def pay=(value)
    if value
      self.paid = true
      self.paid_at = Time.zone.now
    end
  end

  def self.create_monthly_arrearages_installments(user, month, year)
    user.arrearages.monthly.each do |arrearage|
      self.find_or_create_by!(arrearage_id: arrearage.id, month: month, year: year) do |installment|
        installment.value = arreage.get_installment_value
      end
    end
  end
end
