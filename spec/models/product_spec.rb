require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do

      it "必須項目が全てあれば出品できること" do
        expect(@product).to be_valid
      end


      it "nameが40文字でも出品できること" do
        @product.product_name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        expect(@product).to be_valid
      end

      it 'priceが半角数字なら出品できる' do
        @product.price = '123456'
        expect(@product).to be_valid
       end

      it "priceが300ちょうどだと出品できる" do
        @product.price = "300"
        expect(@product).to be_valid
      end

      it "priceが9999999だと出品できる" do
        @product.price = "9999999"
        expect(@product).to be_valid
      end

      it "descriptionが1000文字でも出品できること" do
        @product.description = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        expect(@product).to be_valid
      end

      it "category_idが２以上ならできる" do
       @product.category_id = 2
       expect(@product).to be_valid
      end

      it "shipping_idが２以上ならできる" do
       @product.shipping_id = 2
       expect(@product).to be_valid
      end

      it "prefecture_idが２以上ならできる" do
       @product.prefecture_id = 2
       expect(@product).to be_valid
      end

      it "send_day_idが２以上ならできる" do
       @product.send_day_id = 2
       expect(@product).to be_valid
      end

    end 

    context '出品できないとき' do 

      it "imageが空だとできない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it "nameがない場合は出品できないこと" do
        @product.product_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it "nameが41文字だと出品できないこと" do
        @product.product_name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
      end

      it "descriptionが1001文字だと出品できないこと" do
        @product.description = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
   
   
      
      it "descriptionがない場合は出品できないこと" do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
   
      
      it "category_idが1の場合は出品できないこと" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
   
      
      it "shipping_idが1の場合は出品できないこと" do
        @product.shipping_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping must be other than 1")
      end
  
      it "prefecture_idが1の場合は出品できないこと" do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end
   
      
      it "send_day_idが1の場合は出品できないこと" do
        @product.send_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Send day must be other than 1")
      end
   
    
      it "priceがない場合は出品できないこと" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end


      it "priceが299以下だと出品できないこと" do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
   

      it "priceが10000000だと出品できないこと" do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end 

      it "category_idが空だとできない" do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "shipping_idが空だとできない" do
        @product.shipping_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping can't be blank")
      end

      it "prefecture_idが空だとできない" do
        @product.prefecture_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "send_day_idが空だとできない" do
        @product.send_day_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Send day can't be blank")
      end

      it 'priceが全角数字では出品できない' do 
        @product.price = '１２３４５６７'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
       end 


      it 'priceが全角では出品できない' do 
        @product.price = 'あいうえおか'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
       end 


      it 'priceが半角英字では出品できない' do 
        @product.price = 'qwerty'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
       end 

       it 'priceが半角英数字混合ではできない' do 
        @product.price = '123qwer'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
       end 

      it '紐づくユーザーが存在しないとできない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end

    end
  end  
end
