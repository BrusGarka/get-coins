class Installment < ApplicationRecord

  belongs_to :arrearage

  validates_presence_of :value, :number, :pay_at

  after_update :update_arrearage_status, if: 'self.payd'

  def update_arrearage_status
    if self.arrearage.is_normal? and  self.number == self.arrearage.installment_number
      self.arrearage.update!(payd: true)
    end
  end

  def pay=(value)
    if value
      self.payd = true
      self.payd_at = Time.zone.now
    end
  end
end
