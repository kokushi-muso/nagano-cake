class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: [:クレジットカード, :銀行振込]
  enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
  
  #===オーダー情報のバリデーション=====
  with_options presence: true do
    validates :payment_method
    validates :recieve_name
    validates :address
    validates :postcode
  end

end

