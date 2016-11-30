module HelpsHelper
    def toggle_help_button(post, user)
        if user.helped?(post)
            link_to image_tag("help.png", size:"15", alt: "unhelp"), unhelp_post_path(post), class: "help", id: "unhelp_button", method: :put, remote: true, data: { toggle_src: "unhelp.png", toggle_href: help_post_path(post), id: post.id }
        else
            link_to image_tag("unhelp.png", size:"15",alt: "help"), help_post_path(post), class: "help", id: "help_button", method: :put, remote: true, data: { toggle_src: "help.png", toggle_href: unhelp_post_path(post), id: post.id }
        end
    end
    
    def toggle_help_tag_button(post, user)
        if user.helped?(post)
            link_to image_tag("help.png", size:"15",alt: "unhelp"), unhelp_tagged_post_path(post), class: "help", id: "unhelp_button", method: :put, remote: true, data: { toggle_src: "unhelp.png", toggle_href: help_tagged_post_path(post), id: post.id }
        else
            link_to image_tag("unhelp.png", size:"15",alt: "help"), help_tagged_post_path(post), class: "help", id: "help_button", method: :put, remote: true, data: { toggle_src: "help.png", toggle_href: unhelp_tagged_post_path(post), id: post.id }
        end
    end
end