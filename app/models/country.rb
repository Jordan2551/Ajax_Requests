class Country < ApplicationRecord
  has_many :students
  has_many :cities
end
