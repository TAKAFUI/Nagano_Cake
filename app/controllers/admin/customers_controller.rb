class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @guests = Customer.page(params[:page])
  end

  def show
    @guest = Customer.find(params[:id])
  end

  def edit
    @guest = Customer.find(params[:id])
  end

  def update
    @guest = Customer.find(params[:id])
    @guest.update(customer_params)
    redirect_to admin_customer_path(@guest.id)
  end
end

private

def customer_params
  params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:address,:telephone_number)
end