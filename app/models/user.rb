class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :email
    validates :nickname
    validates :birth_date
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :email,           uniqueness: { case_sensitive: false }
  validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :birth_date,      format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
