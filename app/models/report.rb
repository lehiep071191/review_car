class Report < ApplicationRecord
	belongs_to :post
	belongs_to :user
	validates :user_id, uniqueness: true
	validates :content, presence: true
end
