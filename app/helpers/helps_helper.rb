module HelpsHelper
    def toggle_help_button(post, user)
        if user.helped?(post)
            link_to image_tag('help.png', size:"15", alt: "unhelp"), help_post_path(post), remote: true
        else
            link_to image_tag('unhelp.png', size:"15",alt: "help"), help_post_path(post), remote: true
        end
    end
    
    def toggle_help_tag_button(post, user)
        if user.helped?(post)
            link_to image_tag('help.png', size:"15",alt: "unhelp"), help_tagged_post_path(post), remote: true
        else
            link_to image_tag('unhelp.png', size:"15",alt: "help"), help_tagged_post_path(post), remote: true
        end
    end
end