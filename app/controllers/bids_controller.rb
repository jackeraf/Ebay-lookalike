class BidsController < ApplicationController
	before_action :find_bid, only: [:show, :update, :destroy, :edit]
	before_action :find_product
	before_action :authenticate_user!, only: [:new, :edit]


	def create
		# byebug
		# @bid = Bid.new(bid_params)
		bids_sorted= @product.bids.sort_by {|obj| obj.amount}.reverse
		highest_bid= bids_sorted[0].amount
		if highest_bid.nil?
			if params[:quantity].to_i <= @product.price

				redirect_to product_path(@product), notice: "Your bid must be higher"
			end
		end
			if params[:quantity].to_i <= highest_bid
					redirect_to product_path(@product), notice: "Your bid must be higher"
			elsif params[:quantity].to_i >= @product.price
				if Time.now < @product.deadline
				@bid = Bid.new
				@bid.amount = params[:quantity].to_i
				@bid.product_id = params[:product_id].to_i
				@bid.user_id = current_user.id

					if @bid.save
						redirect_to  product_path(@product)
					# redirect_to  new_product_bid_path
					else
					if @bid.errors
						flash[:error] = @bid.errors
					end
					redirect_to  product_path(@product)
					end
				else
					redirect_to product_path(@product), notice: "Too late to place your bet!"
				end
			end
		

	end

private

def bid_params
	params.require(:bid).permit(:amount)
end

def find_bid
	@bid = Bid.find_by(id: params[:id])

end

def find_product
	@product = Product.find_by(id: params[:product_id])
end

end

