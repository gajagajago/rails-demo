class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @article = Article.order('id DESC').paginate(page: params[:page], per_page: 8)
  end

  def show
    @comment = @article.comments.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
    @photo = @article.photos.build
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      params[:post_attachments]['avatar'].each do |a|
        @article.photos.create!(photo_url: a, article: @article)
      end

      flash[:notice] = "#{@article.title} 을 작성했습니다"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "#{@article.title} 이 업데이트 됐습니다"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :user_id, category_ids: [], post_attachments_attributes: [:id, :avatar])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user && !admin?
      flash[:alert] = "게시글의 작성자가 아닙니다"
      redirect_to @article
    end
  end
end
