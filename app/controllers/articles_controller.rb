class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    # temp assign
    @article.user = User.last

    if @article.save
      flash[:notice] = "Article name: #{params.require(:article).require(:title)} is created!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article name: #{params.require(:article).require(:title)} is updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
