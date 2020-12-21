class Public::ItemsController < ApplicationController
  #商品一覧アクション
  def index
    #ジャンルテーブル全ての表示
    @categories = Category.all
    #ジャンルテーブルの中の商品テーブルから全ての商品取得
    @items =Item.all
  end
  #商品詳細アクション
  def show
    @categories = Category.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  def search
    #カテゴリー検索
    @category = Category.find(params[:id])
    @categories = Category.all
    @item = Item.find(params[:id])
    @items = @category.items
  end

end
