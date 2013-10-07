class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @comment = Comment.new 

    @q = Picture.search(params[:q])
    @pictures = @q.result(distinct: true)

  end

  def show

    @picture = Picture.find_by_url(params[:id])
    
    @comment = Comment.new 
  end

  def new
    @picture = Picture.new
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    if current_user != nil
      @picture.user_id = current_user.id
      data_type = picture_params[:image].headers.split(' ')[5]
      if @picture.save
          redirect_to picture_path(@picture),
            notice: "What a purr-fect picture!"
      else
        redirect_to new_picture_path, notice: "Error"
      end
    else
      redirect_to new_picture_path, notice: "Please Sign In"
    end
  end
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  def upvote
    record_vote(1)
    set_state
    redirect_to @picture
  end

  def downvote
    record_vote(-1)
    set_state
    redirect_to @picture
  end

  private
    def set_state
      if @picture.score == 2
        @picture.approve
      elsif @picture.score == -2
        @picture.reject
      end
    end

    def set_picture
      @picture = Picture.find_by_url(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:title, :image, :user_id)
    end

    def record_vote(value)
       @picture = Picture.find(params[:id])
      if user_signed_in? 
 
        vote = @picture.votes.find_or_initialize_by(user_id: current_user.id)
        vote.value = value
        vote.save
      end
    end
end
