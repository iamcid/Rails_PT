class TherapistsController < ApplicationController

    def new
        @therapist = Therapist.new
    end
    
    def create
        @therapist = Therapist.new(therapist_params)
        if @therapist.save
            session[:therapist_id] = @therapist.id
            redirect_to @therapist
        else
            render :new
        end
    end

    def show
        @therapist = Therapist.find_by_id(params[:id])
        redirect_to '/' if !@therapist
    end

    private

    def therapist_params
        params.require(:therapist).permit(:first_name, :last_name, :email, :password)
    end
end
