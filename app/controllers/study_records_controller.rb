class StudyRecordsController < ApplicationController
  before_action :set_study_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @study_records = current_user.study_records
  end

  def new
    @study_record = StudyRecord.new
  end

  def create
    @study_record = StudyRecord.new(study_record_params)
    @study_record.user_id = current_user.id

    if @study_record.save
      redirect_to study_records_path, notice: t('.study_record_created')
    else
      render :new
    end
  end

  def show
  end

  def edit
    @labels = current_user.labels
  end

  def update
    if @study_record.update(study_record_params)
      redirect_to study_records_path, notice: t('.study_record_updated')
    else
      render :edit
    end
  end

  def destroy
    @study_record.destroy
    redirect_to study_records_path, notice: t('.study_record_destroyed')
  end

  private
  def set_study_record
    @study_record = StudyRecord.find(params[:id])
  end

  def study_record_params
    params.require(:study_record).permit(:title, :content, :learning_cycle, :comprehension, :user_id)
  end
end
