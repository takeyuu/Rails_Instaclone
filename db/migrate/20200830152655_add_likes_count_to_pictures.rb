class AddLikesCountToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :likes_count, :integer
  end
end
