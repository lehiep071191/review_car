class Follow < ApplicationRecord
	# attr_accessor :user_id, :post_id
	belongs_to :user, foreign_key: :user_id, class_name: User.name
	belongs_to :post, foreign_key: :post_id, class_name: Post.name
end
