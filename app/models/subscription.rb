class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency

  enum :status, { active: 0, inactive: 1 }, default: :active
  enum :frequency, { weekly: 0, bi_weekly: 1, monthly: 2 }
end
