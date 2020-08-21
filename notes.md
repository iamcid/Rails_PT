Rails PT appt manager:

** MODELS **
* Therapists(PT or PTA):
    - Associations:
        - has_many :appointments
        - has_many :patients, through: :appointments

    - Attributes:
        - first_name
        - last_name
        - email
        - password_digest
        - uid
        - provider


* Appointments:
    - Associations:
        - belongs_to :therapist
        - belongs_to :patient

    - Attributes:
        - date
        - time
        - initial eval or follow up (check box)

* Patients:
    - Associations:
        - has_many :appointments
        - has_many :therapists, through: :appointments
        - has_many :notes

    - Attributes:
        - name
        - injury_location (text or drop down with specific body area)

* Notes:
    - Association:
        - belongs_to :patient

    - Attributes
        - content

** VIEWS **
* Homepage:
    - Login or Sign Up buttons

* Login page:
    - Login via email
    - Login via Google (omniauth)
    - link to signup page if new user

* Signup page:
    - Sign up form for new user
    - link to login page if user has an account already

* Therapist's show page:
    - Therapist greeted with welcome message, which includes therapist's name.
    - Shows therapist's appointments
    - link to create a new appointment
    - link to each appointment
    - link to logout