class OrdersController < ApplicationController

  def create
    sitter = Sitter.find(params[:sitter_id])
    order  = Order.create!(sitter_id: sitter.id, amount: sitter.price, state: 'pending', user: current_user)

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

end
