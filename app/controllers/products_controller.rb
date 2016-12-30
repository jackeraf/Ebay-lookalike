class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  # if the user is not sign in he cannot access to the product/id/edit url

  # GET /products
  # GET /products.json
  def index
    
    if params[:category].blank?
      # if it's blank, so if nothing has been selected, 
      # it'll display all the products
      if params[:search_term].present?
      
      @products = Product.where(["title LIKE ?", "%#{params[:search_term]}%"])
      
      # Product.where("title like ?", "%#{name}%")
      # For example:

      # %Manhattan will get you: Love in Manhattan
      # Manhattan% will get:  Manhattan and Company
      # %Manhattan% will get you both: [Love in Manhattan, Manhattan and Company]
      
      else
      @products = Product.limit(10).order(:price => 'ASC')

      end
      
    else
      @category_id= Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
      # @category_id is the id that has been taken above 
      # thanks to the name sent by the params
      # and we are going to find all the products of the same id
    end
    
    username
  end

  # GET /products/1
  # GET /products/1.json
  def show

    if @product.ratings.blank?
      @average_rating = 0
    else
      @average_rating = @product.ratings.average(:rating).round(2) 
    end      
    @category= @product.category.name
    
    username
  end

  # GET /products/new
  def new
    @product = current_user.products.new
    @categories= Category.all
    username
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to products_path, :flash => { :error => "Product not found." }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :deadline)
    end
    def username
      if user_signed_in?
        @username= current_user.username.capitalize

      else

      end
      
    end
end
