class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :dishes, dependent: :destroy
end
