class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!

    def update 
        @order_detail = OrderDetail.find(params[:id])
        @order = @order_detail.order
        @order_detail.update(order_detail_params)
        # 紐付く注文商品の製作ステータスが'一つでも製作中'になったら
            if @order_detail.product_status == "製作中"
                # 注文ステータスが製作中に自動更新
                @order.update(status: 2 )
                flash[:success] = "製作ステータスを変更しました"
            else
                # 紐付く注文商品の製作ステータスが'全部製作完了'になったら
                if @order.order_details.where(product_status: 3).count == @order.order_details.count
                    # 注文ステータスが発送準備中に自動更新
                    @order.update(status: 3)
                end
            end
		    redirect_to admin_orders_path(@order_detail.id)
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:product_status)
    end
end