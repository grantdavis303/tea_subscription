require 'rails_helper'

RSpec.describe "Subscription Requests" do
  it 'successfully creates a new tea subscription' do
    customer_1 = Customer.create!(
      first_name: 'Grant',
      last_name: 'Davis',
      email: 'grant@test.com',
      address: '1234 Main Street, Denver, CO 80203'
    )

    tea_1 = Tea.create!(
      name: 'Black Tea',
      description: 'Black tea description',
      temperature: '212',
      brewing_time: '5 Minutes'
    )

    post 'http://localhost:5000/api/v1/users/1/subscriptions', params:
    {
      "customer_id": "1",
      "tea_id": "1"
    }

    expect(response).to be_successful
    expect(response.status).to eq (201)

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_json).to be_a (Hash)
    expect(parsed_json).to have_key (:success)
    expect(parsed_json[:success]).to be_a (String)
    expect(parsed_json[:success]).to eq ('Subscription created successfully')
  end

  it 'successfully changes the status of a subscription from active to cancelled' do
    customer_1 = Customer.create!(
      first_name: 'Grant',
      last_name: 'Davis',
      email: 'grant@test.com',
      address: '1234 Main Street, Denver, CO 80203'
    )

    tea_1 = Tea.create!(
      name: 'Black Tea',
      description: 'Black tea description',
      temperature: '212',
      brewing_time: '5 Minutes'
    )

    sub = Subscription.create!(
      title: 'Subscription to Black Tea',
      price: '$25',
      status: 'active',
      frequency: 'monthly',
      customer_id: customer_1.id,
      tea_id: tea_1.id
    )

    expect(sub[:status]).to eq ('active')

    patch "/api/v1/users/#{customer_1.id}/subscriptions/#{sub.id}"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_json).to be_a (Hash)
    expect(parsed_json).to have_key (:success)
    expect(parsed_json[:success]).to be_a (String)
    expect(parsed_json[:success]).to eq ('Subscription cancelled')
  end

  it 'successfully lists all subscriptions belonging to a customer' do
    customer_1 = Customer.create!(
      first_name: 'Grant',
      last_name: 'Davis',
      email: 'grant@test.com',
      address: '1234 Main Street, Denver, CO 80203'
    )

    tea_1 = Tea.create!(
      name: 'Black Tea',
      description: 'Black tea description',
      temperature: '212',
      brewing_time: '5 Minutes'
    )

    tea_2 = Tea.create!(
      name: 'Green Tea', 
      description: 'Green tea description', 
      temperature: '175', 
      brewing_time: '2 Minutes'
    )

    sub_1 = Subscription.create!(
      title: 'Subscription to Black Tea',
      price: '$25',
      status: 'active',
      frequency: 'monthly',
      customer_id: customer_1.id,
      tea_id: tea_1.id
    )

    sub_2 = Subscription.create!(
      title: 'Subscription to Green Tea',
      price: '$25',
      status: 'cancelled',
      frequency: 'monthly',
      customer_id: customer_1.id,
      tea_id: tea_2.id
    )

    get "/api/v1/users/#{customer_1.id}/subscriptions"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    parsed_json = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_json).to be_a (Hash)
    expect(parsed_json).to have_key (:data)
    expect(parsed_json[:data]).to be_a (Array)
    expect(parsed_json[:data][0]).to be_a (Hash)
    expect(parsed_json[:data][0]).to have_key (:id)
    expect(parsed_json[:data][0]).to have_key (:type)
    expect(parsed_json[:data][0]).to have_key (:attributes)
    expect(parsed_json[:data][0][:id]).to eq (nil)
    expect(parsed_json[:data][0][:type]).to eq ('subscription')
    expect(parsed_json[:data][0][:attributes]).to be_a (Hash)
    expect(parsed_json[:data][0][:attributes]).to have_key (:title)
    expect(parsed_json[:data][0][:attributes]).to have_key (:price)
    expect(parsed_json[:data][0][:attributes]).to have_key (:status)
    expect(parsed_json[:data][0][:attributes]).to have_key (:frequency)
    expect(parsed_json[:data][0][:attributes][:title]).to eq ('Subscription to Black Tea')
    expect(parsed_json[:data][0][:attributes][:price]).to eq ('$25')
    expect(parsed_json[:data][0][:attributes][:status]).to eq ('active')
    expect(parsed_json[:data][0][:attributes][:frequency]).to eq ('monthly')
  end
end