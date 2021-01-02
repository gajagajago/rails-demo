class CommentsController < ApplicationController
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

    redirect_to article_path(@comment.article)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :article_id)
  end
end
