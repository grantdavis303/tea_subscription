class SubscriptionSerializer
  def serialized_json(all_subscriptions)
    {
      "data": all_subscriptions.map do |subscription|
        {
          "id": nil,
          "type": "subscription",
          "attributes": {
            "title": subscription.title,
            "price": subscription.price,
            "status": subscription.status,
            "frequency": subscription.frequency
          }
        }
      end
    }
  end
end