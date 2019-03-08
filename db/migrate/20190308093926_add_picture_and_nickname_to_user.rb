class AddPictureAndNicknameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :picture_url, :string
    add_column :users, :nickname, :string
  end
end
