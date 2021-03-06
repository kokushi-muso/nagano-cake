class Item < ApplicationRecord
  has_many :carts
  has_many :order_items
  belongs_to :genre


  attachment :image

  validates :name, presence: true
  validates :name, uniqueness: true
end