class StudyRecordsController < ApplicationController
  before_action :set_study_record, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_q, only: [:index]

  def index
    # ページネーション用設定（N1対策済み）
    @study_records = @q.result.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @study_record = StudyRecord.new
    @categories = current_user.categories
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    @study_record.user_id = current_user.id

    if @study_record.save
      # 予定復習タイミングを同時に作成
      StudyTiming.create!(study_record_id: @study_record.id,
        first_timing: 1.day.from_now, second_timing: 3.days.from_now,
        third_timing: 10.days.from_now, fourth_timing:  1.month.from_now)
      TimingResult.create!(study_record_id: @study_record.id)

      redirect_to root_path, notice: t('.study_record_created')
    else
      render :new
    end
  end

  def show
    @study_timing = StudyTiming.find_by(study_record_id: params[:id])
  end

  def edit
    @study_records = current_user.study_records
    @categories = current_user.categories
  end

  def update
    if @study_record.update(study_record_params)
      redirect_to root_path, notice: t('.study_record_updated')
    else
      render :edit
    end
  end

  def destroy
    @study_record.destroy
    redirect_to root_path, notice: t('.study_record_destroyed')
  end

  private
  def set_study_record
    @study_record = StudyRecord.find(params[:id])
  end

  def study_record_params
    params.require(:study_record).permit(:title, :content, :study_cycle, :comprehension, :user_id, :category_id)
  end

  # ransack用設定
  def set_q
    @q = StudyRecord.ransack(params[:q])
  end
end
