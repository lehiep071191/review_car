class Hastag < ApplicationRecord
	belongs_to :post, optional: true
end
