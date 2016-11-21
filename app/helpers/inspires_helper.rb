module InspiresHelper
    def toggle_inspire_button(post, user)
        if user.inspired?(post)
            link_to image_tag('inspire.png', size:"15", alt: "uninspire"), inspire_post_path(post), remote: true
        else
            link_to image_tag('uninspire.png', size:"15",alt: "inspire"), inspire_post_path(post), remote: true
        end
    end
    
    def toggle_inspire_tag_button(post, user)
        if user.inspired?(post)
            link_to image_tag('inspire.png', size:"15",alt: "uninspire"), inspire_tagged_post_path(post), remote: true
        else
            link_to image_tag('uninspire.png', size:"15",alt: "inspire"), inspire_tagged_post_path(post), remote: true
        end
    end
end
