class Address < ApplicationRecord
  belongs_to :customer
  # orders/newのプルダウンリスト（登録済み住所）を出すための定義
  def customer_imformation
    "〒" + self.postcode + " " + self.address + " " + self.recieve_name
  end

  #==配送先登録のバリデーション==
  with_options presence: true do
    validates :postcode
    validates :address
    validates :recieve_name
    validates :customer_id
  end

end