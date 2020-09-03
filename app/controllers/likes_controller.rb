class LikesController < ApplicationController
  before_action :set_user
  before_action :set_picture, only: [:create, :destroy]
  before_action :authenticate_user, only: [:show, :create, :destroy]
  def create
    @like = Like.create(user_id: current_user.id, picture_id: @picture.id)
    @picture.reload
  end

  def show
  end

  def destroy
    @like = current_user.likes.find_by(picture_id: @picture.id)
    @like.destroy
    @picture.reload
  end

  private
  def set_picture
    @picture = Picture.find(params[:picture_id])
  end

  def set_user
    @user = current_user
  end
end
