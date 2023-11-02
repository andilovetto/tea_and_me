class Api::V0::SubscriptionsController < ApplicationController

  def create
    begin
      customer = Customer.find(params[:customer_id])
      tea = Tea.find(params[:tea_id])
      params[:title] = create_title(customer, tea)
      subscription = Subscription.create!(subscription_params)
      render json: { "message": "Successfully created Tea & Me subscription!" }, status: 201
    rescue StandardError => e
      render json: ErrorSerializer.error_handler(e), status: 422
    end
  end

  def update
    begin
      subscription = Subscription.find_by!(customer_id: params[:customer_id], tea_id: params[:tea_id])
      if subscription.status == "inactive"
        subscription.update!(status: 0)
        render json: { "message": "Successfully activated Tea & Me subscription!" }, status: 200
      else 
        subscription.update!(status: 1)
        render json: { "message": "Successfully deactivated Tea & Me subscription!" }, status: 200
      end
    rescue StandardError => e
      render json: ErrorSerializer.error_handler(e), status: 422
    end
  end

  def index
    begin
      customer = Customer.find(params[:customer_id])
      render json: SubscriptionSerializer.new(customer.subscriptions)
    rescue StandardError => e
      render json: ErrorSerializer.error_handler(e), status: 422
    end
  end

  private

  def create_title(customer, tea)
    "#{customer.first_name}'s #{tea.title} Subscription"
  end

  def subscription_params
    params.permit(:price, :frequency, :customer_id, :tea_id, :title)
  end
end