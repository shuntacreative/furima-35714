FactoryBot.define do
  factory :product do
           
    product_name  {"商品名"}                                                               
    description   {"説明"}  
    category_id   {2}                                                                 
    status_id     {2}                    
    shipping_id   {2}                   
    send_day_id   {2}                 
    prefecture_id {2}
    price         {500}

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/furima-header01.png'), filename: 'furima-header01.png')
    end

    association :user
  end
end
