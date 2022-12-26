class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :admin_user

  def index
    @users = User.all.order("created_at DESC")
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
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
  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def category_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
