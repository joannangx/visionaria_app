module LikesHelper
    def toggle_like_button(post, user)
        if user.liked?(post)
            link_to image_tag('like.png', size:"15", alt: "unlike"), like_post_path(post), remote: true
        else
            link_to image_tag('unlike.png', size:"15",alt: "like"), like_post_path(post), remote: true
        end
    end
    
    def toggle_like_tag_button(post, user)
        if user.liked?(post)
            link_to image_tag('like.png', size:"15",alt: "unlike"), like_tagged_post_path(post), remote: true
        else
            link_to image_tag('unlike.png', size:"15",alt: "like"), like_tagged_post_path(post), remote: true
        end
    end
end
