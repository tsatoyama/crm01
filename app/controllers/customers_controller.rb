class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    # @customer.save
    # redirect_to @customer
    if @customer.save == true then
      redirect_to @customer
    else
      render :new
    end

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
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params) == true then
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_url
  end
end
