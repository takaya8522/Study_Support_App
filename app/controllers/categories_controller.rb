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
      redirect_to request.referer
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to request.referer
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
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
