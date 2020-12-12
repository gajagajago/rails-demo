class ArticlesController < ApplicationController
  def index
    @article = Article.order('id DESC').paginate(page: params[:page], per_page: 6)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article name: #{@article.title} is created!"
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

    if @article.update(article_params)
      flash[:notice] = "Article name: #{@article.title} is updated!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :description, :user_id)
  end
end
