class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:user_id])

    render json: SubscriptionSerializer.new.serialized_json(customer.subscriptions), status: 200
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])

    Subscription.create!(
      title: "Subscription to #{tea.name}",
      price: '$25', # Default
      status: 'active',
      frequency: 'monthly', # Default
      customer_id: customer.id,
      tea_id: tea.id
    )

    render json: { "success": "Subscription created successfully" }, status: 201

    # Don't create a new subscription if can't find the id of a user
    # Don't create a new subscription if can't find the id of a tea
    # Don't create a new subscription if subscription already exists
  end

  def update
    subscription = Subscription.find_by(customer_id: params[:user_id], tea_id: params[:id])
    subscription.update(
      status: 'cancelled'
    )

    render json: { "success": "Subscription cancelled" }, status: 200

    # Use a serializer to format a better response
    # If subscription can't be found
    # If subscription already exists
  end
end