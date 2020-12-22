class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    
    def index
        @customers = Customer.all
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit 
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to admin_customer_path(@customer.id)
        else
            render :edit
        end
    end
    
    def search
        @customers = Customer.all
        @customer_or_item = params[:option]
        if @customer_or_item == "1"
        @customers = Customer.search(params[:search], @customer_or_item)
        else
        @items = Item.search(params[:search], @customer_or_item)
        end
    end    
    
    private
    def customer_params
         params.require(:customer).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :zipcode, :address, :phone_number, :email, :is_deleted)
    end
end
