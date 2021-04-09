FactoryBot.define do
  factory :purchase_address do
    price {3000}
    address{1-1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
