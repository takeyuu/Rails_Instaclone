class RenameComentColumnToComents < ActiveRecord::Migration[5.2]
  def change
    rename_column :coments, :coment, :content
  end
end
