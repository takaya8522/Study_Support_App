class StudyRecordsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @study_records = StudyRecord.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('.study_record_created')
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_study_record
    @study_record = StudyRecord.find(params[:id])
  end

  def study_record_params
    params.require(:study_record).permit(:title, :content, :learning_cycle, :comprehension)
  end
end
