customer_1 = Customer.create!(
  first_name: 'Grant', 
  last_name: 'Davis', 
  email: 'grant@test.com', 
  address: '1234 Main Street, Denver, CO 80203'
)

customer_2 = Customer.create!(
  first_name: 'Mark', 
  last_name: 'Christopher', 
  email: 'mark@test.com', 
  address: '4321 Sweet Street, Boulder, CO 80200'
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

tea_3 = Tea.create!(
  name: 'Oolong Tea', 
  description: 'Oolong tea description', 
  temperature: '195', 
  brewing_time: '3 Minutes'
)

tea_4 = Tea.create!(
  name: 'Herbal Tea', 
  description: 'Herbal tea description', 
  temperature: '212', 
  brewing_time: '4 Minutes'
)

# Customer 1 Subscriptions

Subscription.create!(
  title: 'Subscription to Black Tea',
  price: '$25',
  status: 'active',
  frequency: 'monthly',
  customer_id: customer_1.id,
  tea_id: tea_1.id
)

Subscription.create!(
  title: 'Subscription to Green Tea',
  price: '$20',
  status: 'active',
  frequency: 'monthly',
  customer_id: customer_1.id,
  tea_id: tea_2.id
)

Subscription.create!(
  title: 'Subscription to Herbal tea',
  price: '$30',
  status: 'cancelled',
  frequency: 'monthly',
  customer_id: customer_1.id,
  tea_id: tea_4.id
)

# Customer 2 Subscriptions

Subscription.create!(
  title: 'Subscription to Black Tea',
  price: '$25',
  status: 'active',
  frequency: 'monthly',
  customer_id: customer_2.id,
  tea_id: tea_1.id
)

Subscription.create!(
  title: 'Subscription to Herbal tea',
  price: '$30',
  status: 'active',
  frequency: 'monthly',
  customer_id: customer_2.id,
  tea_id: tea_4.id
)

puts "Seeded Successfully"