module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Awesome Car"
		page_title.empty? ? base_title : (page_title + " | " + base_title) 
	end
    def options_for_cars
		@registrated.cars.pluck(:name, :id)
	end
	
end
