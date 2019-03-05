class CreateTechnicals < ActiveRecord::Migration[5.2]
  def change
    create_table :technicals do |t|
      t.string :code
      t.string :label

      t.timestamps
    end
  end
end
