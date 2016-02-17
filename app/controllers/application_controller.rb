class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_params,
    if: :devise_controller?

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private

  def after_sign_in_path_for(_resource)
    user_path(current_user) 
  end

  def check_user
    if params[:user_id].to_i != current_user.id
      flash[:danger] = "Restricted.  You cannot view another user's data."
      redirect_to root_path
    end
  end
end
