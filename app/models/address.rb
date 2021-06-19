class Address < ApplicationRecord
  belongs_to :customer
  
  #==配送先登録のバリデーション==
  with_options presence: true do
    validates :postcode
    validates :address
    validates :recieve_name
    validates :customer_id
  end
  
end
<<<<<<< HEAD

=======
>>>>>>> origin/develop
