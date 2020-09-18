class AddCertificateToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :certificate, :string
  end
end
