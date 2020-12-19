class Admin::CategoriesController < ApplicationController
    def index
        @category = Category.new
        @categories = Category.all
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "カテゴリーを追加しました"
            redirect_to admin_categories_path
        else
            render :index
        end
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:success] = "カテゴリーを変更しました"
            redirect_to admin_categories_path(@category.id)
            if @category.is_active == false
                @category.items.each do |item|
                    item.is_active = false
                    item.save
                end
            end
        else
            render :edit
        end
    end
    
   
    
    private
    def category_params
        params.require(:category).permit(:name, :is_active)
    end
    
end
