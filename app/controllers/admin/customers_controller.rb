class Admin::CustomersController < ApplicationController
   
    
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
        if @customer.update
            redirect_to admin_customer_path(@customer.id)
        else
            render :edit
        end
    end
    
    private
    def customer_params
         params.require(:customer).permit(:family_name, :kana_family_name, :zipcode, :address, :phone_number, :email)
    end
end
