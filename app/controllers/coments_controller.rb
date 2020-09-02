class ComentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @coment = @picture.coments.build(coment_params)
    @coment.user_id = current_user.id
    @coment.save
    @coments = @picture.coments.order(created_at: :desc)
  end

  def destroy
    # @coment = Coment.find(params[:id])
  end

  private
  def coment_params
    params.permit(:content, :picture_id)
  end
end
