class Public::ItemsController < ApplicationController
  #商品一覧アクション
  def index
    #ジャンルテーブル全ての表示
    @categories = Categoy.all
    #ジャンルテーブルの中の商品テーブルから全ての商品取得
    @items = @categories.items
  end
  
  
  #商品詳細アクション
  def show
    @categories = Categoy.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
