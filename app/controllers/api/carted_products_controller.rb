class Api::CartedProductsController < ApplicationController

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted"
    )
    if @carted_product.save
      render "show.json.jb"
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    @carted_product.update(status: "removed")
    # @carted_product.status = "removed"
    # @carted_product.save
    render json: {message: "Carted product destroyed"}
  end

end
