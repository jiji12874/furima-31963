class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :city, :prefecture_id, :addresses, :phone_number, :building_name, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :prefecture_id, numericality: { other_than: 1 }#format: {with:  /\A[0-9]+\z/ }
    validates :addresses
    validates :phone_number, format: {with:  /\A[0-9]{,11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, city: city,prefecture_id: prefecture_id, addresses: addresses,phone_number: phone_number, building_name: building_name ,purchase_id: purchase.id )
  end

end