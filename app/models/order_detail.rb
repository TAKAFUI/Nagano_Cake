class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal
    price * amount
  end

  enum production_status: {impossible: 0, wait: 1, processing: 2, complete: 3}

end
