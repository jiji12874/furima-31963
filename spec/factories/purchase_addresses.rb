FactoryBot.define do
  factory :purchase_address do
    price {3000}
    prefecture_id{2}
    city{大阪}
    address{1-1}
    phone_number{000-0000-0000}
    postal{000-0000}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
