class Admin::ItemsController < ApplicationController
    
    
    def top
        
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to admin_items_path
        else 
            render :new
        end
    end
    
    def index
        @items = Item.all
    end
    
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to admin_item_path(@item.id), notice: "successfully updated item!"
        else
            render :edit
        end
    end
    
    
     private
    # ストロングパラメータ
    def item_params
        params.require(:item).permit(:name, :introduction, :category_id, :price, :is_active, :image)
    end
    
end

