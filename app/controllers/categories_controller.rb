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
      flash[:warning] = t('categories.flash.create_success')
    else
      flash[:danger] = t('categories.flash.create_failure')
    end
    redirect_to request.referer
  end

  def update
    if @category.update(category_params)
      flash[:warning] = t('categories.flash.update_success')
    else
      flash[:danger] = t('categories.flash.update_failure')
    end
    redirect_to request.referer
  end

  def destroy
    if @category.destroy
      flash[:warning] = t('categories.flash.destroy_success')
    else
      flash[:danger] = t('categories.flash.destroy_failure')
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
