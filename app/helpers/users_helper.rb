module UsersHelper
    
    def user_has_posts_comments?(user)
        user.posts.exists? || user.comments.exists?
    end
    
    
end
