class Public::HomesController < ApplicationController

  def top
    @categories = Category.all
    # @item = Item.find(params[:id])
    @random = Item.order("RANDOM()").limit(4)
  end

  def about
  end

end
