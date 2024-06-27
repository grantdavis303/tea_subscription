# Migrations Ran
rails g model Customer first_name last_name email address
rails g model Tea name description temperature brewing_time
rails g model Subscription title price status frequency customer:references tea:references

rails db:migrate