module UsersHelper
	def gravatar_for(user, options = { size: 80 })
		size = options[:size]
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
		def check_gender(user)

			if @user.gender == 0
				 "Giới tính: Ẩn"
			elsif @user.gender == 1
				 "Giới tính: Nam"	
			elsif @user.gender == 2
				 "Giới tính: Nữ"	

		end	
	end

end
