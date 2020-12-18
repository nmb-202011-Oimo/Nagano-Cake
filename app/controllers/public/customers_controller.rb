class Public::CustomersController < ApplicationController
  # before_action :ensure_correct_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path(@customer.id), notice: "Updated"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    if @customer.update(is_deleted: true)
      #ログアウトさせる
      reset_session
      flash[:natice] = "ありがとうございました。またのご利用をお待ちしております。"
      redirect_to root_path
    # else
    #   render :unsubscribe
    end
  end

  # def ensure_correct_customer
  #   @customer = Customer.find_by(id:params[:id])
  #   if @customer.id != current_customer.id
  #     redirect_to customers_path(current_customer.id)
  #   end
  # end


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
