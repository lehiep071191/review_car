class Registrated < ApplicationRecord
	has_many :car_registrateds
	has_many :cars, through: :car_registrateds
	validates :car_ids, presence: true

end
