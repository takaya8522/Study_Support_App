class HomesController < ApplicationController
  skip_before_action :authenticate_user! 

  def top
    if user_signed_in?
      @user = User.find(current_user.id)
      @study_records = current_user.study_records
    end
  end

  def about; end
end
