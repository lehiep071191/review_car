class Registration < ApplicationRecord
	belongs_to :user
	belongs_to :car_registrated
end
