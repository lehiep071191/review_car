module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Hiep Demo_app"
		page_title.empty? ? base_title : (page_title + " | " + base_title) 
		
	end

	# def options_for_cars
	# 	Car.all.pluck(:type_car, :id)
	# end

end
