class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :admin_user

  def index
    @users = User.all.order("created_at DESC")
  end

  def show
    @study_records = @user.study_records
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
      flash.now[:warning] = 'ユーザー情報更新しました。'
    else
      flash.now[:danger] = 'ユーザー情報更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:warning] = 'ユーザーの削除に成功しました'
    else
      flash[:danger] = 'ユーザーの削除に失敗しました'
    end
    redirect_to request.referer
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
