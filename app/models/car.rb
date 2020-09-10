class Car < ApplicationRecord
	has_many :car_registrateds
	has_many :registrateds, through: :car_registrateds	
	has_many :registrations, through: :car_registrateds
	validates :name, presence: true, length: { maximum: 50} 
	validates :brand, presence: true, length: { maximum: 50} 
	validates :color, presence: true, length: { maximum: 20} 
	validates :type_car, presence: true, length: { maximum: 50} 
end
