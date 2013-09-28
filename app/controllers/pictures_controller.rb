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
    if @picture.save
      redirect_to picture_path(@picture),
        notice: "What a purr-fect picture!"
    else
      render :new
    end
  end

  protected
  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
