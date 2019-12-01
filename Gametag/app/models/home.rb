class Home < ApplicationRecord
    has_many :comments
    mount_uploader :imagem, PictureUploader
    belongs_to :user
end
