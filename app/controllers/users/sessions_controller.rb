class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: t('users.flash.login_success')
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to root_path, notice: t('users.flash.login_admin_success')
  end
end