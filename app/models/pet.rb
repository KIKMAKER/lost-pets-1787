class Pet < ApplicationRecord
  # set rules for saving a pet in the db
  validates :location, :date_found, presence: true
end
