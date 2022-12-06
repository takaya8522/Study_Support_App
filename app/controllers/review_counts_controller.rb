class ReviewCountsController < ApplicationController
  before_action :authenticate_user!

  def update
    study_record = StudyRecord.find(params[:id])
    # カウントが４未満なら1足す
    study_record[:review_count] += 1 if study_record[:review_count] < 4

    if study_record.update_attribute(:review_count, study_record[:review_count])
      # 実際に復習したタイミングを保存するために作成済みのレコードを探す
      timing_result = TimingResult.find_by(study_record_id: study_record.id)
      # どのタームの復習か判断するメソッドを使ってハッシュで呼び出す
      timing = TimingResult.check(review_count_params)
      # {first_term: 現在時刻}を使って更新する。
      unless timing_result.update(timing)
        flash[:danger] = 'チェックを入れてから登録してください'
      end

      if study_record[:review_count] >= 4
        study_record.update_attribute(:comprehension, true)
        # and return を使って明示的に早期終了させる
        redirect_to user_complete_path(user_id: current_user.id) and return
      else
        flash[:danger] = '復習登録に失敗しました'
      end
      flash[:warning] = '復習登録に成功しました'
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
