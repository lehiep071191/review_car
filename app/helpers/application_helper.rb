module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Awesome Car"
		page_title.empty? ? base_title : (page_title + " | " + base_title) 
	end
    def options_for_cars
		@registrated.cars.pluck(:name, :id)
	end
	
	def sub_content_field form
	    sub_content = form.object.hastags.build
	    form.fields_for :hastags, sub_content,
	      child_index: "hello" do |builder|
	      render "hastags_fields", f: builder
	    end
	end
	def average_rating
		average = []
			average = @post.ratings.pluck(:rate)
		(average.inject(0.0) { |sum, el| sum + el } / average.size).round(1)	
	end		 


 	def hienthipost
		likes = {}
		Post.all.each do |post|
			likes[post.id] =   post.follows.count
		end	
		likes.sort_by(&:last).reverse
	end	
end
