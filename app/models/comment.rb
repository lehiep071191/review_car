class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :subcomments
	scope :order_by_time, -> { order(created_at: :desc) }
end
