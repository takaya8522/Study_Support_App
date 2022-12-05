class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ edit update destroy ]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to user_categories_path(current_user), notice: Category.human_attribute_name(:category_created)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to user_categories_path(current_user), notice: Category.human_attribute_name(:category_updated)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to user_categories_path(current_user), notice: category.human_attribute_name(:category_destroyed)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
