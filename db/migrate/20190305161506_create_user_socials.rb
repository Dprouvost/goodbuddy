class CreateUserSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :user_socials do |t|
      t.references :user, foreign_key: true
      t.references :social, foreign_key: true

      t.timestamps
    end
  end
end
