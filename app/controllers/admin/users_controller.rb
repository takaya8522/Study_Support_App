class Admin::UsersController < ApplicationController
  before_action :admin_user

  def index
    @users = User.all.order("created_at DESC")
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:warning] = 'ユーザーの削除に成功しました'
    else
      flash[:danger] = 'ユーザーの削除に失敗しました'
    end
    redirect_to request.referer
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def category_params
    params.require(:user).permit(:name)
  end
end
