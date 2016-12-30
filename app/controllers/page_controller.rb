class PageController < ApplicationController

	def index

  	products= Product.order("RANDOM()").limit(10)
    @images= products.map do |product| product.image_url end
    
    @latest_products = Product.order(:created_at => 'ASC').limit(3)
    

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
