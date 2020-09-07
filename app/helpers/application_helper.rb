module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Awesome Car"
		page_title.empty? ? base_title : (page_title + " | " + base_title) 
	end
    def options_for_cars
		@registrated.cars.pluck(:name, :id)
	end
	def display
		@post = Post.all
		display_post = {}
		display_post[:@post] = @post.follows

	end	
	def hienthipost
		likes = []
		Post.all.each do |post|
			display_post = {}
			display_post[post.follows.count] =   post.id
			likes << display_post
			likes.sort_by{|_k, v| v}
		end	
		

		
		
	end	
end
