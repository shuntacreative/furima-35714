class PurchaseUserAddress
include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :flat_number, :apartment, :phone_number, :user_id, :product_id, :token
  

  with_options presence: true do  
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city 
    validates :flat_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :product_id
    validates :token
  end
 

    def save
     
      purchase_user =  PurchaseUser.create(user_id: user_id, product_id: product_id)
      Address.create(flat_number: flat_number, apartment: apartment, post_code: post_code, prefecture_id: prefecture_id, phone_number: phone_number, city: city, purchase_user_id: purchase_user.id)
    end
end

#ickname: nickname, email: email, password: password, first_name: first_name_kanji, family_name: last_name_kanji, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birthday: birthday
#(name: name, flat_number: flat_number, post_code: post_code, description: description, category_id: category.id, status_id: status.id, shipping_id: shipping.id, prefecture_id: prefecture.id, send_day_id: send_day.id, price: price, user_id: user.id)

 #@purchase_user =  PurchaseUser.create(user_id: user_id, product_id: product_id)
 #Address.create(flat_number: flat_number, post_code: post_code, prefecture_id: prefecture.id, phone_number: phone_number, city: city, purchase_user_id: purchase_user.id)