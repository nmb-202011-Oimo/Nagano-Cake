class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?

# ログイン時に遷移するpathを設定
    def after_sign_in_path_for(resource)
        if customer_signed_in?
            root_path
        else
            admin_top_path
        end
    end

# ログアウト後に遷移するpathを設定
    def after_sign_out_path_for(resource)
        root_path
    end


    def configure_permitted_parameters
      if resource_class == Customer
            devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,:first_name,:kana_family_name,:kana_first_name,:zipcode,:address,:phone_number,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
      end
    end
end

