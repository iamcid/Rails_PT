class AppointmentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)
        # byebug
        # @appointment = current_user.appointments.build(appointment_params)
        if @appointment.save
            flash[:notice] = "Appointment booked! See you then!"
            redirect_to therapist_appointments_path(@appointment.therapist_id, @appointment.id)
        else
            flash[:error] = "Appointment was not saved, please try again!"
            render :new
        end
    end

    def show
        # byebug
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :time, :appointment_type)
    end
end
