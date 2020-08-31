class LikesController < ApplicationController
  before_action :set_picture
  def create
    @like = Like.create(user_id: current_user.id, picture_id: @picture.id)
    @picture.reload
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
end
