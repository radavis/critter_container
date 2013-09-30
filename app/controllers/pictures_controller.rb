class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def index

  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(picture_params)
    # if picture_params[:image].nil?
    #   if @picture.save
    #   redirect_to picture_path(@picture),
    #       notice: "What a purr-fect picture!"
    #   else
    #     redirect_to new_picture_path, notice: "Error"
    #   end
    #   return true
    # end
      data_type = picture_params[:image].headers.split(' ')[5]

        if @picture.check_type?(data_type)
          @picture.save
            redirect_to picture_path(@picture),
              notice: "What a purr-fect picture!"
        else
          redirect_to new_picture_path, notice: "Error"
        end
  end

  protected
  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
