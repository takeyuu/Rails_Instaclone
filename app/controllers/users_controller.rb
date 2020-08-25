class UsersController < ApplicationController
before_action :select_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    begin
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        flash.now[:danger] = 'エラーがあります'
        render :new
      end
    rescue
      flash.now[:danger] = 'すでに登録されたメールアドレスです'
      render :new
    end
  end

  def show
    @picture = current_user.pictures.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = 'エラーがあります'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :self_introduction, :icon_image)
  end

  def select_user
    @user = User.find(params[:id])
  end
end
