class ApplicationController < ActionController::Base
  # CSRF対策 サイトへのコード攻撃を防ぐ
  protect_from_forgery with: :exception
  # devise用
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:added_attrs, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:added_attrs, :image])
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
