class Project < ApplicationRecord
  belongs_to :user
  belongs_to :product
  mount_uploader :image, ProjimageUploader
end
