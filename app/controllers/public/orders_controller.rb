class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @cart_items = current_customer.cart_items
    if @cart_items.present?
      render :new
    else
     redirect_to cart_items_path
    end
  end
 
 def confirm
   @order = Order.new #<=一応newで作ってみたが必要かは不明
   @order.customer_id = current_customer.id
   @cart_items = current_customer.cart_items #<=ユーザーのカート内商品をインスタンスに格納
   @order.shipping_fee = 800  #<=送料、いつかここの800もモデルに記入してadmin側で変更したい
   #@order.total_price = @order.shipping_fee + @cart_items.subtotal_price
   @order.payment = params[:payment]
   if params[:address_option] == "0"
     @order.zipcode = current_customer.zipcode
     @order.address = current_customer.address
     @order.name = current_customer.family_name + current_customer.first_name #<=強引に入れた、多分成功しない
   elsif params[:address_option] == "1"
      order_address = Shipping.find(params[:address_id]) #<=上に同じくだいぶ強引に入れた多分無理
      @order.zipcode = order_address.zipcode
      @order.address  = order_address.address
      @order.name = order_address.name
   else
      @order.zipcode = params[:zipcode]
      @order.address = params[:address]
      @order.name = params[:name]
   end
 end
   
   def create
     @order = Order.new(order_params)
     if @order.save
         current_customer.cart_items.each do |item|
           @order_detail = OrderDetail.new({
            order_id: @order.id, item_id: item.item_id, quantity: item.quantity, price: item.tax_price})
           @order_detail.save
         end
     else
         render :new
         return
     end
     current_customer.cart_items.destroy_all
     shipping = current_customer.shippings
     newshipping = shipping.find_by(zipcode: @order.zipcode)
     if newshipping == nil
       shipping = Shipping.new(customer_id: current_customer.id, name: @order.name, zipcode: @order.zipcode, address: @order.address)
       shipping.save
       flash[:notice] = "住所が新規登録されました"
       redirect_to complete_order_path(@order.id)
     else
      redirect_to complete_order_path(@order.id)
     end
   end
   
   def index
     @customer = current_customer
     @orders = @customer.orders
   end
   
   def show
     @order = Order.find(params[:id])
     @order_details =@order.order_details
     if @order.customer_id != current_customer.id
       redirect_to new_order_path
     end
   end
   
   private
   
   def order_params
   params.require(:order).permit(:customer_id, :shipping_fee, :payment, :total_price, :zipcode, :address, :name, :status)
   end
end
