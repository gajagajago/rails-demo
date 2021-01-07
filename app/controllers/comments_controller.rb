class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "댓글을 작성했습니다"
    else
      flash[:alert] = "댓글 작성에 실패했습니다"
    end

    if(@comment.commentable)
      redirect_to article_path(@comment.commentable.article)
    else
      redirect_to article_path(@comment.article)
    end

  end

  def edit
  end

  def update
    if(@comment.update(comment_params))
      flash[:notice] = "댓글이 업데이트 됐습니다"
    end

    if(@comment.commentable)
      redirect_to article_path(@comment.commentable.article)
    else
      redirect_to article_path(@comment.article)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :article_id, :commentable_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
