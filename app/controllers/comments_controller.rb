class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :find_commentable, only: :create
  def new
    @comment = Comment.new
  end
  def show
    @comment = Comment.find_by_id(params[:id])
  end
  def create
    @comment = @commentable.comments.new(comment_params)

    @comment.user_id = current_user.id

    @comment.author_name = current_user.user_name
    @comment.loop_count = @level

    @comment.holla_id = @holla.id
    if @comment.save
      redirect_to @holla, success: 'Successfuly posted comment'
    else
      redirect_to @holla, notice: "Couldn't  post comment. Try again?"
    end

  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id])
      @holla = Holla.find(@commentable.holla_id)
      @level = @commentable.loop_count + 1
    else
      if params[:holla_id]

        @holla = Holla.find_by_id(params[:holla_id])

        @commentable = @holla
        @level = 0

      end
    end

  end

end
