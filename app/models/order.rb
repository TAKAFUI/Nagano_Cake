class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details,dependent: :destroy

  validates:postal_code, presence:true
  validates:address, presence:true
  validates:name, presence:true


  enum payment_method: { credit_card: 0, transfer: 1 }

  #enum status: {'入金待ち':'入金待ち', '入金確認':'入金確認','製作中':'製作中','発送準備中':'発送準備中', '発送済み':'発送済み' }

  enum status: { wait: 0, confirmation: 1, process: 2, preparation: 3, sending: 4}

end
