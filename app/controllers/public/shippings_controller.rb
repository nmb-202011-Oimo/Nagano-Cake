class Public::ShippingsController < ApplicationController

  def index
    @shipping = Shipping.new
    # @customer = Customer.find(params[:id])
    @shippings = current_customer.shippings
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      redirect_to shippings_path, notice: 'Saved'
    else
      @shippings = current_customer.shippings
      render :index
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      redirect_to shippings_path, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    if @shipping.destroy
      redirect_to shippings_path, notice: 'Deleted'
    end
  end

  private
  def shipping_params
    params.require(:shipping).permit(:zipcode, :address, :name)
  end
end
