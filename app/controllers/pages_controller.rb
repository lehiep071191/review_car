class PagesController < ApplicationController

  def search
  	if params[:search].blank?  
    	redirect_to(root_path, alert: "Empty field!") and return  
	else  
	 	parameter = params[:search]  
 		@results = Post.all.where("lower(title || content)  LIKE ?", "%#{parameter}%") 
	end  
  end
end
