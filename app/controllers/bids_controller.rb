class BidsController < ApplicationController
	before_action :find_bid, only: [:show, :update, :destroy, :edit]
  before_action :find_product
    before_action :authenticate_user!, only: [:new, :edit]

  
  def create
    @bid = Bid.new(bid_params)
    @bid.product_id = @product.id
  	@bid.user_id = current_user.id


  	@bids = Bid.all.order("created_at DESC") 
		@highest_bid = @bids.limit(1)
		@bids = @bids.limit(5)
		

    if @bid.save
    	redirect_to  new_product_bid_path
    else
			if @bid.errors
			flash[:error] = @bid.errors.full_messages[0]
			end
    	redirect_to  new_product_bid_path
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
end
