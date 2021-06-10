class ApplicationController < ActionController::Base

    helper_method :current_admin
    helper_method :logged_in?

    def current_admin
        Admin.find_by(id: session[:admin_id])  
    end

    def logged_in?
        !current_admin.nil?  
    end


end
