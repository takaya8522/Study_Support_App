class UsersController < ApplicationController
  before_action :correct_user?

  def show
    @user = User.find(params[:id])
    @study_records = current_user.study_records
  end

  def edit
    @user = User.find(current_user.id)
  end

  # ユーザー情報の更新を非同期で処理
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash.now[:warning] = 'ユーザー情報更新しました。'
    else
      flash.now[:danger] = 'ユーザー情報更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash.now[:warning] = 'ユーザー情報更新しました。'
    else
      flash.now[:danger] = 'ユーザー情報更新に失敗しました。'
      render :edit
    end
  end

  private

  def correct_user?
    return if User.find(params[:id]) == current_user
    redirect_to root_path, alert: "他のユーザーページにはアクセスできません。"
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
