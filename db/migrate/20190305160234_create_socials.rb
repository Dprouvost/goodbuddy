class CreateSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :socials do |t|
      t.string :code
      t.string :label
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
