class AddNotifyToStatements < ActiveRecord::Migration[5.1]
  def change
    add_column :statements, :notify, :boolean
    add_column :statements, :paid, :boolean
  end
end
