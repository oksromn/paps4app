class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :value, presence: true, format: { with: /\A\d.?\d{0,3}\z/ }
end
