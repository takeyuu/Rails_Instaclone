class PicturesController < ApplicationController
  def new
    @picture = current_user.pictures.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @user = current_user

    respond_to do |format|
      if @picture.invalid?
        # format.html { render template: "users/show" }
        # format.json { render json: @picture.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      else
        # format.html { render template: "users/show" }
        # format.json { render template: "users/show", status: :created, location: @user }
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

  private
  def picture_params
    params.require(:picture).permit(:article, :image, :image_cache)
  end
end
