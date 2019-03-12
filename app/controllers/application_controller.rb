class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    '/feed'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :address, :photo_cache, :content])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  protected

  def resolve_layout
    if controller_name =~ /events|tasks|questions/ && action_name =~ /index/
      "sidebar_index"
    elsif controller_name =~ /events|tasks|questions/ && action_name =~ /show/
      "sidebar_layout_show"
    else
      "application"
    end
  end
end
