class Public::CartItemsController < ApplicationController
  
  #ユーザーに紐づいたカート内商品全表示
  def index
    @cart_items = current_customer.cart_items
  end
  
   # 商品詳細画面から、「カートに入れる」を押した時のアクション
  def create
    if @cart_item.blank? #<=カート内商品に選択した商品が入っていなかった場合
      @item = Item.find(params[:item][:item_id])
      @cart_item = Cart_items.new(cart_item)  #<=がカート内商品を商品IDから追加
      @cart_item.customer_id = current_customer.id #<=カート内商品に現在のカスタマーを追加
      @cart_item.item_id = @item　　　　　　　　　#<=カート内商品に商品のIDを
    end
    @cart_item.quantity += params[:quantity].to_i #<=show画面で設定した個数をカート内商品に追加
    @cart_item.save   #<=カート内商品保存
    redirect_to cart_items_path #<=カート内商品一覧にリダイレクト
  end
  
  
  def update
    @cart_item.update(quantity: params[:quantity].to_i) #<=カートアイテム内の個数変更
    redirect_to cart_items_path
  end
  
 def destroy
    @cart_item = CartItem.find(params[:id]) #<=カート内の一つの商品のdestroyアクション
    @cart_item.destroy
    redirect_to cart_items_path 
 end
 
   def all_destroy
    @customer = current_customer #<= 現在のユーザーをインスタンスに格納
    @cart_items = @customer.cart_items #<=現在のユーザーのカートアイテムをインスタンスに格納
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
    
  
  
  private
  def cart_item
  params.require(:cart_iteme).permit(:quantity)
  end
  
end
