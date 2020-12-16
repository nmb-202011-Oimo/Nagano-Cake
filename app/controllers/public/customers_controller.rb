class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(
      :email,
      :family_name,
      :first_name,
      :kana_family_name,
      :kana_first_name,
      :zipcode,
      :address,
      :phone_number
    )
  end
end
