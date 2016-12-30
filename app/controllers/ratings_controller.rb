class RatingsController < ApplicationController
	before_action :find_product
	before_action :find_rating, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	# if the user is not sign in he cannot access to the product/id/ratings/edit url

	def new
		
		@rating= Rating.new


		# new has a view file whereas create only 
		# makes changes to the database
	end

	def create
		
		@rating = Rating.new(rating_params)
		@rating.product_id = @product.id
		@rating.user_id = current_user.id
		
		if @rating.save
			redirect_to product_path(@product)
		else
			render "new"
		end
	end
	def edit
		
	end
	def update
		if @rating.update(rating_params)
			redirect_to product_path(@product)
		else
			render "edit"
		end
	end

	def destroy
		@rating.destroy
		redirect_to product_path(@product)
	end
	private

	def rating_params

		params.require(:rating).permit(:rating)
		
	end
	def find_product
		@product= Product.find(params[:product_id])
		
	end
	def find_rating
		@rating= Rating.find(params[:id])
	end
end
