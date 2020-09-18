class Follow < ApplicationRecord
	# attr_accessor :user_id, :post_id
	belongs_to :user
	belongs_to :post
end
