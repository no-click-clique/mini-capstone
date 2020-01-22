class Product < ApplicationRecord

  validates :name, presence: true

  def is_discounted?
    # return true is price is less than 10
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
