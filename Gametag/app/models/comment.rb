class Comment < ApplicationRecord
    belongs_to :home
    belongs_to :user
end
