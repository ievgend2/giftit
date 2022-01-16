module UsersHelper
    def avatar_for(user)
        if user.avatar.attached?
            image_tag(user.avatar, class:"col-8")
        else
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
            image_tag(gravatar_url, alt: user.username, class: "gravatar")
        end
    end
end
