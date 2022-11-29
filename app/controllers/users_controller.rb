class UsersController < ApplicationController
  before_action :admin_user?

  def show
    @user = User.find(params[:id])
    @study_records = current_user.study_records
  end

  private

  def admin_user?
    return if User.find(params[:id]) == current_user
    redirect_to root_path, alert: "他のユーザーページにはアクセスできません。"
  end
end
