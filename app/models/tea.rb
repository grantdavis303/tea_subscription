class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  validates_presence_of :name,
                        :description,
                        :temperature,
                        :brewing_time
end