class Admin::CategoriesController < ApplicationController
    def index
        @category = Category.new
        
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to admin_categories_path
        else
            render :index
        end
    end
    
    
    
    private
    def category_params
        params.require(:category).permit(:name, :is_active)
    end
    
end
