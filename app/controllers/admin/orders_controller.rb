class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    
    def update
        @order = Order.find(params[:id])
        @order_details = @order.order_details
        if @order.update(order_params)
            if @order.status == "入金確認"
                @order_details.update_all(product_status: 1 )
                flash[:success] = "注文ステータスを変更しました"
                redirect_to admin_order_path(@order.id)
            end
        else
            render :show
        end
    end
    
    
   private
	def order_params
		  params.require(:order).permit(:status)
	end
end