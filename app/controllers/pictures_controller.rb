class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
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

  def destroy
    redirect_to pictures_path, notice:"削除しました！"
  end

  def update
    if @picture.update(picuture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
