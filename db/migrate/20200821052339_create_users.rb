class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :icon_image
      t.text :self_introduction
      t.timestamps
    end
  end
end
