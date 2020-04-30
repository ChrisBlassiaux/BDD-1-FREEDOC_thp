class Specialty < ApplicationRecord
  has_many :specialty
  has_many :doctors, through: :specialty
end
