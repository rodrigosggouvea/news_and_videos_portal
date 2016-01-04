class CommentsController < ApplicationController
  before_action :authenticate_user!

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

    def comment_params
      params.require(:comment).permit(:commentable_id, :commentable_type, :user_id, :message, :locale)
    end
end
