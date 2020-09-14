class Registration < ApplicationRecord
	attr_accessor :car_id, :registrated_id
	belongs_to :user
	belongs_to :car_registrated	
	enum drive_lisence: [:B1, :B2, :C, :D, :E, :FC, :FD, :FE]

end
