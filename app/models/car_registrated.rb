class CarRegistrated < ApplicationRecord
	belongs_to :registrated
	belongs_to :car
	has_many :registrations, dependent: :destroy
	has_many :users, through: :registrations
end
