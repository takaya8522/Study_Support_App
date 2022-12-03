class HomesController < ApplicationController
  skip_before_action :authenticate_user! 

  def top
    if user_signed_in?
      @user = User.find(current_user.id)
      # ページネーション用設定（N1対策済み）
      @study_records = current_user.study_records.includes(:user).order(created_at: :desc).page(params[:page])
    end
  end

  def about; end
end
