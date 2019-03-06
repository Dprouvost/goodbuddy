class CreateProfileCats < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_cats do |t|
      t.integer :category_id
      t.string :profile_id
      t.references :category, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
