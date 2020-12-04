class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def show
    # byebug
    @article = Article.find(params[:id])
  end
end
