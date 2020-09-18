class StaticPagesController < ApplicationController
  include ApplicationHelper
  def index
  end
   
  def home
  	hienthipost
  end

  def help
  end

  def about
  end
end
