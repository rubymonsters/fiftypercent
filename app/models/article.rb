class Article

  attr_accessor :title, 
                :pubDate, 
                :dc_creator, 
                :excerpt_encoded, 
                :content_encoded,
                :tags,
                :post_type,
                :wp_status
  
  def created_at
    Time.parse(@pubDate)
  end
  
  def unwanted?
    created_at.year == -1 or post_type != 'post' 
  end

end