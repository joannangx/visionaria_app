module HelpsHelper
    def toggle_help_button(post, user)
        if user.helped?(post)
            link_to image_tag("help.png", size:"15", alt: "unhelp", data: { toggle_src: image_path("unhelp.png") }), unhelp_post_path(post), class: "help", id: "unhelp_button", method: :put, remote: true, data: { toggle_href: help_post_path(post), id: post.id }
        else
            link_to image_tag("unhelp.png", size:"15",alt: "help", data: { toggle_src: image_path("help.png") }), help_post_path(post), class: "help", id: "help_button", method: :put, remote: true, data: { toggle_href: unhelp_post_path(post), id: post.id }
        end
    end
    
    def toggle_help_tag_button(post, user)
        if user.helped?(post)
            link_to image_tag("help.png", size:"15", alt: "unhelp", data: { toggle_src: image_path("unhelp.png") }), unhelp_tagged_post_path(post), class: "help", id: "unhelp_button", method: :put, remote: true, data: { toggle_href: help_tagged_post_path(post), id: post.id }
        else
            link_to image_tag("unhelp.png", size:"15",alt: "help", data: { toggle_src: image_path("help.png") }), help_tagged_post_path(post), class: "help", id: "help_button", method: :put, remote: true, data: { toggle_href: unhelp_tagged_post_path(post), id: post.id }
        end
    end
end