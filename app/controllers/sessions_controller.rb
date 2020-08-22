class SessionsController < ApplicationController

    # def home
    # end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        therapist = Therapist.find_by(email: params[:therapist][:email])
        if therapist && therapist.authenticate(params[:therapist][:password])
            session[:therapist_id] = therapist.id
            redirect_to therapist_path(therapist)
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to "/login"
        end
    end

end
