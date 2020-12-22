class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!

    def update 
        @orders = Order.all
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.update(order_detail_params)
            if @order_detail.product_status == "製作中"
                @orders.update_all(status: "製作中" )
                flash[:success] = "製作ステータスを変更しました"
		        redirect_to admin_orders_path(@order_detail.order)
		    end
        else
	        render "order/show"
        end
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:product_status)
    end
end