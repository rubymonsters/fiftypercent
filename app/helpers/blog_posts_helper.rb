module BlogPostsHelper
  def extract_first_image_path(post)
    caption, image_path = post.body.match(/\[([^\[\]]+)\]\((\/images\/[^)]+)/).try(:captures)

    if image_path.present?
      URI.join(request.base_url, image_path)
    else
      URI.join(request.base_url, 'marie-curie-speakerinnen.jpg')
    end
  end
end
