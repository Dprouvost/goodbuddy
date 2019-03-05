class CreateTechnicalsChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :technicals_choices do |t|
      t.string :code
      t.string :label
      t.references :technicals_compatibilities, foreign_key: true

      t.timestamps
    end
  end
end
