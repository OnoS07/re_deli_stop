class Post < ApplicationRecord
	attachment :post_image
	belongs_to :user
    has_many :post_comments, dependent: :destroy

	validates :title, presence: true ,length: {maximum: 20}
	validates :body, presence: true ,length: {maximum: 100}
	validates :post_image, presence: true
end
