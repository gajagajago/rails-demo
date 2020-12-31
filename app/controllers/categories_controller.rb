class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @category = Category.order('id DESC').paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if(@category.save)
      flash[:notice] = "카테고리: #{@category.name}가 생성되었습니다!"
      redirect_to @category
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
