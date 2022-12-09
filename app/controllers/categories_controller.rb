class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ update destroy ]

  def index
    @categories = current_user.categories.page(params[:page])
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:warning] = 'カテゴリーの追加に成功しました'
    else
      flash[:danger] = 'カテゴリーの追加に失敗しました'
    end
    redirect_to request.referer
  end

  def update
    if @category.update(category_params)
      flash[:warning] = 'カテゴリーの更新に成功しました'
    else
      flash[:danger] = 'カテゴリーの更新に失敗しました'
    end
    redirect_to request.referer
  end

  def destroy
    if @category.destroy
      flash[:warning] = 'カテゴリーの削除に成功しました'
    else
      flash[:danger] = 'カテゴリーの削除に失敗しました'
    end
    redirect_to request.referer
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
