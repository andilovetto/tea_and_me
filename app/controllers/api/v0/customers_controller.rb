class Api::V0::CustomersController < ApplicationController

  def create
    begin 
      customer = Customer.new(customer_params)
      customer.save!
      render json: { "message": "Successfully created Tea & Me subscriber!" }, status: 201
    rescue StandardError => e
      render json: ErrorSerializer.error_handler(e), status: 422
    end
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end