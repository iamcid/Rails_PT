class Appointment < ApplicationRecord
  belongs_to :therapist
  belongs_to :patient

  accepts_nested_attributes_for :patients
  # validates :date, presence: true
  # validates :time, presence: true
  # validates :appointment_type, presence: true

end
