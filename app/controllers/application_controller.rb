class ApplicationController < ActionController::Base
   before_action :authenticate_user!, except: [:top]

   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

　def before_action :set_current_user
 　  @current_user=User.find_by(id: session[:user_id])
　end

　def fobid_login_user
    if @current_user
      flash[:notice]="ログインしています"
      redirect_to("/posts/index")
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
