class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
   
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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    
    
  end

  def update
   
    if @product.update(product_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  def destroy
    
    if @product.destroy
      redirect_to root_path
    end
  end

  private
 def product_params
    
    params.require(:product).permit(:product_name, :category_id, :price, :description, :status_id, :shipping_id, :send_day_id, :prefecture_id, :image, :category_id, :status_id, :shipping_id , :send_day_id, :prefecture_id).merge(user_id: current_user.id)
  end 

  def move_to_index
    @product = Product.find(params[:id])
    unless @product.user.id == current_user.id
        redirect_to root_path
    end
  end

end
