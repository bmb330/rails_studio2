module UsersHelper
	def profile_image_for(user, options={})
		size = options[:size] || 80
		image_tag "http://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}", alt: user.name
	end
end
