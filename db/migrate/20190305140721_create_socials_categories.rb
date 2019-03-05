class CreateSocialsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :socials_categories do |t|
      t.string :code
      t.string :label
      t.references :socials_choices, foreign_key: true

      t.timestamps
    end
  end
end
