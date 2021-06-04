FactoryBot.define do
  factory :purchase_user_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京' }
    flat_number { '1-1' }
    apartment { '東京ハイツ' }
    phone_number {'09012345678'}
  end

 
end