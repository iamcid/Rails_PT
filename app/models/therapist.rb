class Therapist < ApplicationRecord
    has_secure_password

    has_many :appointments
    has_many :patients, through: :appointments

    accepts_nested_attributes_for :appointments

    def self.create_from_omniauth(auth)
        therapist = Therapist.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |t|
            t.first_name = auth[:info][:first_name]
            t.last_name = auth[:info][:last_name]
            t.email = auth[:info][:email]
            t.password = SecureRandom.hex(17)
        end
    end

    # validates :first_name, presence: true
    # validates :last_name, presence: true
    # validates :email, presence: true, uniqueness: true
end
