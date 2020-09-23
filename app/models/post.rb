class Post < ApplicationRecord
	mount_uploader :video, VideoUploader
	belongs_to :user
	has_many :follows, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :reports, dependent: :destroy
	has_many :hastags, dependent: :destroy
	has_many :ratings, dependent: :destroy
	has_one_attached :image
	scope :order_by_time,->{ order(created_at: :desc) }
	validates :user_id, presence: true
	validates :content, presence: true
	validates :title, presence: true
	validates :image,content_type: { in: %w[image/jpeg image/gif image/png],
										message: "must be a valid image format" },
										size:
									{ less_than: 5.megabytes,
										message: "should be less than 5MB" }, presence: true
	validates_associated :hastags, presence: true
	enum status: [:init, :rejected, :accepted]	

	enum brand: [:other, :mercedes, :ferrari, :lamborghini, :porsche, :audi, :bmw, :volkswagen]								

	accepts_nested_attributes_for :hastags, allow_destroy: true
	
	def feed_comment
		self.comments
	end
	def display_image
		image.variant(resize_to_limit: [300,300])
	end
	class << self
		def buy_count        
	        count_buy = Post.group(:id).where("created_at >=?", 1.month.ago).count
	        count_buy = count_buy.sort_by {|k, v| v}[-3..-1]     
    	end

	end		
 
end
