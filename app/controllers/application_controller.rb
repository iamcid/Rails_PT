class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private
        def current_user
            @current_user ||= Therapist.find_by_id(session[:therapist_id]) if session[:therapist_id]
        end

        def logged_in?
            !!session[:therapist_id]
        end
    
        def redirect_if_not_logged_in
            redirect_to '/' if !logged_in? 
        end
end
