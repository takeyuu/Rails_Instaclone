class PicturesController < ApplicationController
  before_action :select_picture, only: [:edit, :update, :destroy]
  def new
    @picture = current_user.pictures.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @user = current_user

    respond_to do |format|
      if @picture.invalid?
        format.js { @status = "fail" }
      else
        format.js { @status = "success" }
      end
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = 'エラー！'
      render template: 'users/show'
    end
  end

  def show
  end

  private
  def picture_params
    params.require(:picture).permit(:article, :image, :image_cache)
  end

  def select_picture
    @picture = Picture.find(params[:id])
  end
end
