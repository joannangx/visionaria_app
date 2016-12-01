module InspiresHelper
    def toggle_inspire_button(post, user)
        if user.inspired?(post)
            link_to image_tag("inspire.png", size:"15", alt: "uninspire", data: { toggle_src: image_path("uninspire.png") }), uninspire_post_path(post), class: "inspire", id: "uninspire_button", method: :put, remote: true, data: { toggle_href: inspire_post_path(post), id: post.id }
        else
            link_to image_tag("uninspire.png", size:"15",alt: "inspire", data: { toggle_src: image_path("inspire.png") }), inspire_post_path(post), class: "inspire", id: "inspire_button", method: :put, remote: true, data: { toggle_href: uninspire_post_path(post), id: post.id }
        end
    end
    
    def toggle_inspire_tag_button(post, user)
        if user.inspired?(post)
            link_to image_tag("inspire.png", size:"15", alt: "uninspire", data: { toggle_src: image_path("uninspire.png") }), uninspire_tagged_post_path(post), class: "inspire", id: "uninspire_button", method: :put, remote: true, data: { toggle_href: inspire_tagged_post_path(post), id: post.id }
        else
            link_to image_tag("uninspire.png", size:"15",alt: "inspire", data: { toggle_src: image_path("inspire.png") }), inspire_tagged_post_path(post), class: "inspire", id: "inspire_button", method: :put, remote: true, data: { toggle_href: uninspire_tagged_post_path(post), id: post.id }
        end
    end
end
