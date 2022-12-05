class HomesController < ApplicationController
  skip_before_action :authenticate_user! 
  before_action :set_q, only: [:top], if: proc { user_signed_in? }

  def top
    if user_signed_in?
      # ページネーション用設定（N1対策済み）
      @study_records = @q.result.includes(:user).order(created_at: :desc).page(params[:page])
    end
  end

  def about; end

  private

  # ransack用設定
  def set_q
    @q = current_user.study_records.ransack(params[:q])
  end
end
