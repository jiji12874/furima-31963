FactoryBot.define do
  factory :item do
    name              { '医者が教える最強の食事術' }
    info              { '食事管理についての書籍です。' }
    category_id       { 2 }
    status_id         { 2 }
    cost_id           { 2 }
    prefecture_id     { 2 }
    day_id            { 2 }
    price             { 1500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
