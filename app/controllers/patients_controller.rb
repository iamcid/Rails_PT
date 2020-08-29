class PatientsController < ApplicationController
    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            flash[:message] = "Patient successfully created!"
            redirect_to patients_path
        else 
            flash[:message] = "Patient was not created, please try again!"
            redirect_to new_patient_path
        end
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :injury_location)
    end
end
