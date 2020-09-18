class AddPlaceAndNameToStatements < ActiveRecord::Migration[5.1]
  def change
    add_column :statements, :place, :string
    add_column :statements, :name, :string
  end
end
