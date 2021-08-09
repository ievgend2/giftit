class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :category
    belongs_to :user

    validates :title, presence: true
    validates :description, presence: true
    validates_associated :user
end
