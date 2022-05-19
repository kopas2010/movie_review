class User::CommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review.id)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to review_path(comment.review.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    Comment.find(params[:id]).destroy
    redirect_to review_path(comment.review.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
