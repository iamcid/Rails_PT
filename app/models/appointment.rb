class Appointment < ApplicationRecord
  belongs_to :therapist
  belongs_to :patient

  validates :date, presence: true
  validates :time, presence: true
  validates :appointment_type, presence: true

end
