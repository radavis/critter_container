class CommentsController < ApplicationController

  def index
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to picture_path(@picture),
        notice: "Comment successfully posted"
    else
      redirect_to picture_path(@picture),
        notice: "Your comment was not posted"
    end
  end

  def new
    @comment = Comment.new
    @picture = Picture.find(params[:picture_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end



end
