class Api::ProductsController < ApplicationController

  def all_products_action
    @products = Product.all #array of hashes
    render "all_products.json.jb"
  end

  def first_product_action
    @product = Product.first #hash of product data
    render "first_product.json.jb"
  end

  def second_product_action
    @product = Product.find_by(id: 2)
    render "first_product.json.jb"
  end

end
