class AddLocationToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :location, :string
  end
end
