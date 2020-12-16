class Admin::ItemsController < ApplicationController
    
    
    def top
        
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new
        if @item.save
            redirect_to admin_items_path(@item.id)
        else 
            render :new
        end
    end
    
    def index
        @items = Item.all
    end
    
    
    def show
    end
    
    def edit
    end
    
    def update
    
    end
    
    
     private
    # ストロングパラメータ
    def item_params
        params.require(:item).permit(:name, :introduction, :category, :price)
    end
    
end

