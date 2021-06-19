class Customer < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, through: :carts, source: :item
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ======お客様登録時のバリデーション============
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :address
    validates :email
    validates :postcode
    validates :phone_number
  end

  #カスタマーが退会していなければtrue
  def active_for_authentication?
    super && (self.is_valid == true)
  end

end