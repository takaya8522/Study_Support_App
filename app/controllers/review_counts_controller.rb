class ReviewCountsController < ApplicationController
  before_action :authenticate_user!

  def update
    study_record = StudyRecord.find(params[:id])
    # 実際に復習したタイミングを保存するために作成済みのレコードを探す
    timing_result = TimingResult.find_by(study_record_id: study_record.id)
    # どのタームの復習か判断するメソッドを使ってハッシュで呼び出す
    timing = TimingResult.check_timing(review_count_params)
    # 現在の復習回数を変数に代入する
    count = study_record[:review_count]
    # カウントが４未満なら1足す
    count += 1 if count < 4

    if timing && count >= 4
      timing_result.update(timing)
      study_record.update(review_count: count, comprehension: true)
      redirect_to user_complete_path(user_id: current_user.id)
      flash[:notice] = '全ての復習が完了しました'
    elsif timing
      timing_result.update(timing)
      study_record.update(review_count: count)
      flash[:notice] = '復習登録に成功しました'
      redirect_to request.referer
    elsif timing == false
      flash[:danger] = 'チェックを入れてから登録してください'
      redirect_to request.referer
    else
      flash[:danger] = '復習登録に失敗しました'
      redirect_to request.referer
    end
  end

  private

  def review_count_params
    params.require(:study_record).permit(:study_record_id, :first_record, :second_record, :third_record, :fourth_record)
  end
end
