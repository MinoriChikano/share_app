class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(picture_params)
    if @picture.save
    redirect_to pictures_path, notice: "作成完了"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picuture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
