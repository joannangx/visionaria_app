module LikesHelper
    def toggle_like_button(post, user)
        if user.liked?(post)
            link_to image_tag("like.png", size:"15", alt: "unlike"), dislike_post_path(post), class: "like", id: "unlike_button", method: :put, remote: true, data: { toggle_src: "/assets/unlike-c7271b2d6a58a051f1b3780f285d65ecd40119582c1fa9b0c79de083acd3d82b.png", toggle_href: like_post_path(post), id: post.id }
        else
            link_to image_tag("unlike.png", size:"15", alt: "like"), like_post_path(post), class: "like", id: "like_button", method: :put, remote: true, data: { toggle_src: "/assets/like-1aeedb4437c2ee1f1f2d3cf168ed58c6b7c59260a582c8c3722d33b7373a5381.png", toggle_href: dislike_post_path(post), id: post.id }
        end
    end
    
    def toggle_like_tag_button(post, user)
        if user.liked?(post)
            link_to image_tag("like.png", size:"15",alt: "unlike"), dislike_tagged_post_path(post), class: "like", id: "unlike_button", method: :put, remote: true, data: { toggle_src: "/assets/unlike.png", toggle_href: like_tagged_post_path(post), id: post.id }
        else
            link_to image_tag("unlike.png", size:"15",alt: "like"), like_tagged_post_path(post), class: "like", id: "like_button", method: :put, remote: true, data: { toggle_src: "/assets/like.png", toggle_href: dislike_tagged_post_path(post), id: post.id }
        end
    end
end
