class Api::OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    product = Product.find(params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if @order.save
      # calculated_subtotal = @order.quantity * @order.product.price
      # calculated_tax = calculated_subtotal * 0.09
      # calculated_total = calculated_subtotal + calculated_tax
      # @order.update(
      #   subtotal: calculated_subtotal,
      #   tax: calculated_tax,
      #   total: calculated_total
      # )
      # attribute writers and .save
      # @order.subtotal = calculated_subtotal
      # @order.tax = calculated_tax
      # @order.total = calculated_total
      # @order.save
      render "show.json.jb"
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
