class CreateStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :statements do |t|
      t.string :email
      t.string :fio
      t.string :phone
      t.string :position
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
