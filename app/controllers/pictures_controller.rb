class PicturesController < ApplicationController
  before_action :select_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :confirm, :create, :edit, :update, :destroy]
  def top
    @picture = Picture.all
  end

  def new
    @picture = current_user.pictures.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @picture.id = params[:id]
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
    @user = current_user
    if @picture.save
      PostMailer.post_mail(@picture).deliver
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = 'エラー！'
      render template: 'users/show'
    end
  end

  def show
    @coments = @picture.coments.order(created_at: :desc)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def picture_params
    params.require(:picture).permit(:article, :image, :image_cache)
  end
end
