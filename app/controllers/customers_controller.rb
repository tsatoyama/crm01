class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to @customer

    # redirect_to @customerの場合、以下と同じ挙動になる模様
    # redirect_to "/customers/#{@customer.id}"
    # redirect_to customer_url(id: @customer.id)
    # redirect_to customer_url(id: @customer.to_param)
  end

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
      )
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
