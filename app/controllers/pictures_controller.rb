class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /pictures
  # GET /pictures.json
  def index
    @q = Picture.search(params[:q])
    @pictures = @q.result(distinct: true)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new 
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  def create

    @picture = Picture.new(picture_params)

    # params[:picture][:image].content_type
    data_type = picture_params[:image].headers.split(' ')[5]

    if @picture.check_type?(data_type)
      @picture.save
        redirect_to picture_path(@picture),
          notice: "What a purr-fect picture!"
    else
      redirect_to new_picture_path, notice: "Error"
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
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

  # DELETE /pictures/1
  # DELETE /pictures/1.json
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

    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :image)
    end

    def record_vote(value)
      if user_signed_in? 
        vote = @picture.votes.find_or_initialize_by(user_id: current_user.id)
        vote.value = value
        vote.save
      end
    end
end
