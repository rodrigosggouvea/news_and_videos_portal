class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:update, :destroy]

  def index
    @comments = Comment.unmoderated
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save if @comment.valid?

    redirect_to @comment.commentable, notice: t('.success')
  end

  def update
    @comment.update(comment_params)
    redirect_to comments_path, notice: t('.success')
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice: t('.destroy')
  end

  private

  def set_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :user_id, :message, :locale, :moderated)
  end
end
