module PostsHelper
 	def hienthipost
		likes = {}
		Post.all.each do |post|
			likes[post.id] =   post.follows.count
		end	
		likes.sort_by(&:last).reverse
	end
end
