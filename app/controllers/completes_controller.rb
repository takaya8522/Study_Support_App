class CompletesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_study_record, only: %i[show]

  # 復習が完了した学習一覧
  def index
    @study_records = StudyRecord.where(user_id: params[:user_id], comprehension: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  # 復習が完了した学習一覧の詳細
  def show
    @study_timing = StudyTiming.find_by(study_record_id: params[:id])
    @timing_result = TimingResult.find_by(study_record_id: params[:id])
  end

  # 学習記録を理解済みに変更するメソッド
  def change_comprehension
    study_record = StudyRecord.find(params[:id])
    if study_record.update(comprehension: true)
      flash[:warning] = '理解度ステータスを更新しました'
      redirect_to user_completes_path(user_id: current_user.id)
    else
      flash[:danger] = '理解度ステータスの更新に失敗しました'
      redirect_to request.referer
    end
  end

  private
  def set_study_record
    @study_record = StudyRecord.find(params[:id])
  end
end
