class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: t('users.flash.guest_failure')
    elsif resource.email == 'guest_admin@example.com'
      redirect_to root_path, alert: t('users.flash.guest_admin_failure')
    end
  end
end