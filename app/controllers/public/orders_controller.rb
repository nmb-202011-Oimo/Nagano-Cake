class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
 
 def confirm
   @order = Order.new #<=一応newで作ってみたが必要かは不明
   @cart_items = current_customer.cart_items #<=ユーザーのカート内商品をインスタンスに格納
   @shipping_fee = 800  #<=送料、いつかここの800もモデルに記入してadmin側で変更したい
   @order_payment = params[:order][:payment]
   if params[:order][:address_option] == "0"
     @order_address = current_customer.shipping #<=強引に入れた、多分成功しない
    elsif params[:order][:address_option] == "1"
      @order_address = Shipping.find(params[:zipcode], [:address], [:name]) #<=上に同じくだいぶ強引に入れた多分無理
    else
      
   end
 end
end
