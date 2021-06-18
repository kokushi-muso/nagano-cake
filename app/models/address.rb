class Address < ApplicationRecord
  belongs_to :customer
  # orders/newのプルダウンリスト（登録済み住所）を出すための定義
  def customer_imformation
    "〒" + self.postcode + " " + self.address + " " + self.recieve_name
  end
end