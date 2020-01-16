class Api::ProductsController < ApplicationController

  def all_products_action
    @products = Product.all #array of hashes
    render "all_products.json.jb"
  end

end
