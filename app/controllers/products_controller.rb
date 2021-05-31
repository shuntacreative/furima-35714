class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
   
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
  def product_params
    
    params.require(:product).permit(:product_name, :category_id, :price, :description, :status_id, :shipping_id, :send_day_id, :prefecture_id, :image, :category_id, :status_id, :shipping_id , :send_day_id, :prefecture_id).merge(user_id: current_user.id)
  end

end