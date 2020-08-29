class TherapistsController < ApplicationController

    def new
        @therapist = Therapist.new
    end
    
    def create
        @therapist = Therapist.new(therapist_params)
        if @therapist.save
            flash[:message] = "Successful signup. Welcome!"
            session[:therapist_id] = @therapist.id
            redirect_to @therapist
        else
            flash[:message] = "Unsuccessful signup! Please try again!"
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @therapist = Therapist.find_by_id(params[:id])
        redirect_to '/' if !@therapist
    end

    private

    def therapist_params
        params.require(:therapist).permit(:first_name, :last_name, :email, :password)
    end
end
