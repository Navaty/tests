class AddCertificateToStatements < ActiveRecord::Migration[5.1]
  def change
    add_column :statements, :certificate, :string
  end
end
