class Home < ApplicationRecord
    mount_uploader :imagem, PictureUploader
    belongs_to :user
end
