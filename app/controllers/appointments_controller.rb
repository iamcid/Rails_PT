class AppointmentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @appointment = Appointment.new
    end
end
