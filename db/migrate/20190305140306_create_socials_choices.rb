class CreateSocialsChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :socials_choices do |t|
      t.string :code
      t.string :label
      t.references :socials_compatibilities, foreign_key: true

      t.timestamps
    end
  end
end
