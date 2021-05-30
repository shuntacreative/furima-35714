class Product < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :shipping
  belongs_to :status

  
  with_options presence:true do
   validates :image         
   validates :product_name                                                                
   validates :description     
   
   with_options numericality: { other_than: 1 } do
    validates :category_id                                                                    
    validates :status_id                         
    validates :shipping_id                      
    validates :send_day_id                    
    validates :prefecture_id  
   end
   
   with_options format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank"}
   end
  end                
 
end
