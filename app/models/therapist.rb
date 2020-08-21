class Therapist < ApplicationRecord
    has_secure_password

    has_many :appointments
    has_many :patients, through: :appointments

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
end
