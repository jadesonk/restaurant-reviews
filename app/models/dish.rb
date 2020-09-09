class Dish < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true
end
