class Home < ApplicationRecord
    acts_as_votable
    has_many :comments
    mount_uploader :imagem, PictureUploader
    belongs_to :user
end