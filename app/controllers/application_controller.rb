class ApplicationController < ActionController::Base
     before_action :configure_permitted_parameters, if: :devise_controller?

# ログイン時に遷移するpathを設定
    def after_sign_in_path_for(resource)
        if customer_signed_in?
            customer_path(resource)
        else
            admin_top_path
        end
    end
  
# ログアウト後に遷移するpathを設定
    def after_sign_out_path_for(resource)
        root_path 
    end
end

