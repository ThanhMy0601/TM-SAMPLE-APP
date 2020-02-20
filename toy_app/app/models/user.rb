class User < ApplicationRecord
  has_many :microposts
  # Replace FILL_IN with the right code.
  # validates FILL_IN, presence: true
  # validates FILL_IN, presence: true
  validates :name, presence: true #validates -> xac dinh tinh hop le cua data
  validates :email, presence: true #presence -> ko dc de trong
end
