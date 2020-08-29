class AppointmentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        # @appointments = current_user.appointments.select {|a| a.persisted?}
        # @appointment = current_user.appointments.build
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)
        # @appointment = current_user.appointments.build(appointment_params)
        # byebug
        if @appointment.save
            flash[:message] = "Appointment booked! See you then!"
            redirect_to therapist_appointments_path(@appointment.therapist_id, @appointment.id)
        else
            flash[:message] = "Appointment was not saved, please try again!"
            redirect_to new_therapist_path(@appointment.therapist_id, @appointment.id)
        end
    end
    
    def show
    end

    def update
        if @appointment.update(appointment_params)
            redirect_to appointments_path
        else
            flash[:message] = "Appointment was not updated, please try again!"
            render :edit
        end
    end

    def destroy
        @appointment.destroy
        redirect_to appointments_path
    end
 

    private

    def appointment_params
        params.require(:appointment).permit(:date, :time, :appointment_type, :therapist_id, :patient_id)
    end
end
