module PicturesHelper
  def select_picture
    @picture = Picture.find(params[:id])
  end

  def choose_confirm
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm' || action_name == 'show'
      confirm_pictures_path
    elsif action_name == 'edit' || action_name == 'update'
      picture_path
    end
  end
end
