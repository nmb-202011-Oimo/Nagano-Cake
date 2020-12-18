class ApplicationController < ActionController::Base
     
     
     
     def configure_permitted_parameters
      if resource_class == Customer
            devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,:first_name,:kana_family_name,:kana_first_name,:zipcode,:address,:phone_number,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
      end
    end
end
