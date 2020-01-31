class Product < ApplicationRecord

  # association method
  belongs_to :supplier
  has_many :images
  has_many :orders
  
  has_many :category_products
  has_many :categories, through: :category_products

  # def categories
  #   category_products.map { |category_product| category_product.category }
  # end

  # def supplier
  #   Supplier.find_by(id: supplier_id) #returns a supplier hash
  # end


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: {in: 10..500 }

  # model method
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
