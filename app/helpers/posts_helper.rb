module PostsHelper
    def user_is_authorized_for_post?(post)
        current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
    end

      def user_is_authorized_for_deleting_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end
end

















=begin

 def user_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.moderator? || current_user.admin?)
   end

   def user_is_authorized_for_post_action?(post, action)
    if action == :delete
      authorized = current_user && (current_user == post.user || current_user.admin?)
    else
      authorized = current_user && (current_user == post.user || current_user.moderator? || current_user.admin?)
    end

    return authorized
    end
end

=end

