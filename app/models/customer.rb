class Customer < ApplicationRecord
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, through: :carts, source: :item
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end