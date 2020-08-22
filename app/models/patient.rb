class Patient < ApplicationRecord
    has_many :appointments
    has_many :therapists, through: :appointments
    has_many :notes

    validates :name, presence: true

end
