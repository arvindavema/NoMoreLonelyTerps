class CommentsController < ApplicationController
  before_action :load_user
  before_action :load_comment, only: [:show, :destroy]
  before_action :find_commentable, only: [:new, :create]

  def new
    @comment = @commentable.comments.new user_id: @user.id, author_name: @user.user_name, loop_count: @level, holla_id:  @holla.id
  end

  def show
  end

  def create
    @comment = @commentable.comments.create user_id: @user.id, holla_id: @holla.id, author_name: @user.user_name, loop_count: @level, body: params.dig(:comment, :body)
    redirect_to @commentable
  end

  def destroy
    @comment.destroy if @comment.user == @user
  end

  private

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def load_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:comment_id]
    @commentable = Comment.find(params[:comment_id])
    @holla = Holla.find(@commentable.holla_id)
    @level = @commentable.loop_count + 1
    else
      if params[:holla_id]
        @holla = Holla.find(params[:holla_id])
        @commentable = @holla
        @level = 0
      end
    end
  end

end
