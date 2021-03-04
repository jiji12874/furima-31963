class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :birth_date,      format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
end