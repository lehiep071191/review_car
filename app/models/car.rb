class Car < ApplicationRecord
	has_many :car_registrateds
	has_many :registrateds, through: :car_registrateds	
	has_many :registrations, through: :car_registrateds
end
