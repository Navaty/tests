class Statement < ApplicationRecord
  mount_uploader :certificate, CertificateUploader
  belongs_to :test
end
