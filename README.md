# Tea Subscription

### There is currently no live deployment of this application.

### About

This is an API-only application.

### Setup

```
[Fork and clone this repository]

cd tea_subscription

bundle install
rails db:{drop,create,migrate,seed}
rails s

[Open LocalHost:5000]
```

### Versions

- Ruby 3.2.2
- Rails 7.1.3.4

### Progress

- [ ] End Point 1 - Subscribe a customer to a tea subscription
- [ ] End Point 2 - Cancel a customer's tea subscription
- [ ] End Point 3 - See all of a customer's subscriptions (both active and cancelled)

### End Points / Wireframes

**End Point 1**
- Create a subscription
- Need to pass in customer's id

```
POST /api/v1/users/:id/subscriptions
Content-Type: application/json
Accept: application/json

{
  "customer_id": "1",
  "tea_id": "1"
}
```

**End Point 1 Happy Path Response**

```
{
  "success": "Subscription created successfully.",
}
```

**End Point 2**
- Update a subscription's status from active to cancelled
- Need to pass in customer's id and subscription_id

```
PATCH /api/v1/users/:id/subscriptions/:id
Content-Type: application/json
Accept: application/json
```

**End Point 3**
- Retrieve all of a customer's subscriptions
- Need to pass in customer's id

```
GET /api/v1/users/:id/subscriptions
Content-Type: application/json
Accept: application/json
```

### Goals

**Project Completion**

- [ ] Meets all MVP expectations provided by the challenge and is easy to use by the end user.

**Project Completion**

- [ ] Has clear documentation including sections like a summary, setup instructions, endpoints/wireframes, testing instructions, etc. 
- [ ] Clear user stories are built out on the project board and there is a clear progression of tickets moved over to the Done column.

**Final Presentation**

- [ ] Able to speak to process and planning structure. Demos their project and speaks to implementation and tests. Able to speak to and defend their design decisions. Uses good technical terminology.

### Tests

* 20 Total Tests (80 / 80 LOC (100.0%) covered)
* 20 Model Tests (80 / 80 LOC (100.0%) covered)

Testing Instructions

### Resources

* [GitHub Project Board]()
* [Tea Temperatures Guide](https://www.kitchenaid.com/pinch-of-help/countertop-appliances/tea-temperatures.html)

### Contributors

* Grant Davis | [GitHub](https://github.com/grantdavis303), [LinkedIn](https://www.linkedin.com/in/grantdavis303/)