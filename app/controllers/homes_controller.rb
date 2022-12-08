class HomesController < ApplicationController
  skip_before_action :authenticate_user! 

  def top
    if user_signed_in?
      @study_records = StudyRecord.where(user_id: current_user.id, comprehension: false).includes(:user)

      order_array = StudyRecord.latest_study_record(@study_records, current_user.id)
      # idと何周目かと学習タイミング、カテゴリー名、タイトル、内容の配列
      @order_study_records = order_array[0]
      # ジャンル名の配列
      @categories = order_array[1]
    end
  end

  def about; end
end
