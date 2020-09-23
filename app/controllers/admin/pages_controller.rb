class Admin::PagesController < ApplicationController

  def search
  	if params[:search].blank?  
    	redirect_to(admin_home_path, alert: "Empty field!") and return  
	else  
	 	parameter = params[:search]  
 		@result_posts = Post.all.where("lower(title || content)  LIKE ?", "%#{parameter}%") 
	end  
  end
end
