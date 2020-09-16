class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end
  
  def create
    product = Product.find_by(id: params[:product_id])
    cal_subtotal = product.price * params[:quantity].to_i
    cal_tax = product.tax * params[:quantity].to_i
    cal_total = cal_subtotal + cal_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: cal_subtotal,
      tax: cal_tax,
      total: cal_total,
    )
    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }
    end
  end
end
