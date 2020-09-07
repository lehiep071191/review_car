class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :follows, dependent: :destroy
	has_many :registrations
	has_many :car_registrateds, through: :registrations
	# has_many :followeds, through: :follows, foreign_key: :post_id, class_name: Follow.name		
	attr_accessor :remember_token
	before_save :downcase_email
	validates :name, length:{ maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
							length: {maximum: 225}
	has_secure_password
	validates :password, length: {maximum: 30}, presence: true, allow_nil: true
	
	
	class << self
		def digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
			BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end	
		def new_token
			SecureRandom.urlsafe_base64
		end	

	end	

	def remember
			self.remember_token = User.new_token
		update remember_digest: User.digest(remember_token)
	end	
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end	
	def forget
		update remember_digest: nil
	end	
	def current_user?(user)
		user && user == self
	end
	def feed
		self.posts
	end

	def follow(post)
		following << post
	end
	def unfollow(post)
		following.delete(post)
	end
	def following?(post)
		following.include?(post)
	end
	
	# Returns true if the current user is following the other user.


	private 
	def downcase_email
		self.email = email.downcase
	end							


end
