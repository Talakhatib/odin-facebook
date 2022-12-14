class ApplicationController < ActionController::Base
     include UsersHelper

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || user_path(current_user)
    end

#     def after_sign_up_path_for(resource)
#      stored_location_for(resource) || user_path(new_user_session_path)
#    end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :date_of_birth,:email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:date_of_birth ,:email, :password, :current_password)}
         end
end
