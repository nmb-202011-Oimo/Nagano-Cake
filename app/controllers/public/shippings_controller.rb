class ShippingsController < ApplicationController

  def index
    @shipping = Customer.new
    @customer = Customer.find(params[:id])
    @shippings = @customer.shippings
  end

  def edit
  end

  private
  def shipping_params
    params.require(:shipping).permit(
      :zipcode,
      :address,
      :name
    )
  end
end
