class Api::V1::SubscriptionsController < ApplicationController
  def create
    # binding.pry
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
end