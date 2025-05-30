class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You are not authorized to perform this action."
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # Para el signup (registro)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    # Para la edición del usuario (opcional)
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
