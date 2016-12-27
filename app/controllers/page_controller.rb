class PageController < ApplicationController

	def index

  	
  	if user_signed_in?
  		@username= current_user.username.capitalize
      
  	else
  		render "index"
  	end

  end

  def about_the_page
  	render "about_the_page"
  end

  
end
