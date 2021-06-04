class PurchaseUserController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_product, only: [:index]
  before_action :hello_params

  def index
    @purchase_user_address = PurchaseUserAddress.new
    
  end

  def create
    @purchase_user_address = PurchaseUserAddress.new(purchase_user_address_params)
    

    if @purchase_user_address.valid?
      pay_item
      @purchase_user_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def hello_params
    @product = Product.find(params[:product_id]
  end

  def sold_out_product
    
    redirect_to root_path if !@product.purchase_user.present? && @product.user.id == current_user.id
   end

  def purchase_user_address_params
    params.require(:purchase_user_address).permit(:post_code, :price, :prefecture_id, :city, :flat_number, :apartment, :phone_number, :user, :product).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: Product.find(purchase_user_address_params[:product_id]).price, 
        card: purchase_user_address_params[:token],   
        currency: 'jpy'              
      )
    end
end
