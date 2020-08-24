class SessionsController < ApplicationController

    def home
    end

    def new
    end

    def omniauth
        therapist = Therapist.create_from_omniauth(auth)
        if therapist.valid?
            therapist.save
            session[:therapist_id] = therapist.id
            redirect_to therapist_path(therapist.id)
        else
            flash[:message] = therapist.errors.full_message
            redirect_to root_path
        end
    end

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

    private

    def auth
        request.env['omniauth.auth']
    end

end
