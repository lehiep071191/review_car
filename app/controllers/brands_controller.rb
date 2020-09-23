class BrandsController < ApplicationController
	def index
		@brands = Post.all
		if params[:brand_type] == "mercedes"
			@brands = Post.mercedes
		elsif params[:brand_type] == "lamborghini"
			@brands = Post.lamborghini
		elsif params[:brand_type] ==  "ferrari"
			@brands = Post.ferrari
		elsif params[:brand_type] == "porsche"
			@brands = Post.porsche	
		elsif params[:brand_type] == "audi"
			@brands = Post.audi
		elsif params[:brand_type] == "bmw"
			@brands = Post.bmw 	
		elsif params[:brand_type] == "volkswagen"
			@brands = Post.volkswagen
		else 
			@brands = Post.other	
		end				
	end

end	