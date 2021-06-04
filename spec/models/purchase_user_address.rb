require 'rails_helper'

RSpec.describe PurchaseUserAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_user_address = FactoryBot.build(:purchase_user_address, user_id: user.id, product_id: product.id)
      sleep(0.1)
    end

    context '問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_user_address).to be_valid
      end

      it "prefecture_idが２以上ならできる" do
        @purchase_user_address.prefecture_id = 2
        expect(@purchase_user_address).to be_valid
       end
  
      it 'apartmentは空でも保存できること' do
        @purchase_user_address.apartment = ''
        expect(@purchase_user_address).to be_valid
      end
    end  

    context '問題がある場合' do

      it 'token空ではできない' do
        @purchase_user_address.token = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @purchase_user_address.post_code = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_user_address.post_code = '1234567'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'post_codeが半角英字だと保存できないこと' do
        @purchase_user_address.post_code = 'aaa-aaaa'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角数字だと保存できないこと' do
        @purchase_user_address.post_code = '１２３−４５６７'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end


      it "prefecture_idが空だとできない" do
        @purchase_user_address.prefecture_id = ""
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Prefecture can't be blank")
      end
     
      it "prefecture_idが1の場合は出品できないこと" do
        @purchase_user_address.prefecture_id = 1
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "phone_numberが空の場合は出品できないこと" do
        @purchase_user_address.phone_number = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが9桁以下の場合は出品できないこと" do
        @purchase_user_address.phone_number = '123456789'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが12桁以上の場合は出品できないこと" do
        @purchase_user_address.phone_number = '123456123456'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号は英数混合では保存できない" do
        @purchase_user_address.phone_number = '12345612qwer'
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'flat_numberが空ではできないこと' do
        @purchase_user_address.flat_number = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Flat number can't be blank") 
      end 

      it 'cityが空ではできないこと' do
        @purchase_user_address.city = ''
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("City can't be blank") 
      end 


      it 'userが紐付いていないと保存できないこと' do
        @purchase_user_address.user_id = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐づいていないとできないこと' do
        @purchase_user_address.product_id = nil
        @purchase_user_address.valid?
        expect(@purchase_user_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
