module UsersHelper

    def format_username(user)
        link_to '~' + user.username, user_path(user)
    end

end