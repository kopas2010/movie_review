class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.page(params[:page]).per(10)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to admin_review_path(comment.review.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    Comment.find(params[:id]).destroy
    redirect_to admin_review_path(comment.review.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
