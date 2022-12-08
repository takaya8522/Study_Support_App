class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    elsif resource.email == 'guest_admin@example.com'
      redirect_to root_path, alert: 'ゲスト管理者ユーザーは削除できません。'
    end
  end
end