class Appointment < ApplicationRecord
  belongs_to :therapist
  belongs_to :patient

  accepts_nested_attributes_for :patient
  # validates :date, presence: true
  # validates :time, presence: true
  # validates :appointment_type, presence: true

  # def patient_attributes=(attr)
  #   if attr[:name] != "" && attr[:injury_location]
  # end
end
