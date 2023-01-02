class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
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
      flash.now[:warning] = t('admin.users.flash.update_success')
      redirect_to admin_users_path
    else
      flash.now[:danger] = t('admin.users.flash.update_failure')
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:warning] = t('admin.users.flash.destory_success')
    else
      flash[:danger] = t('admin.users.flash.destroy_failure')
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
    params.require(:user).permit(:name, :email, :admin)
  end
end
