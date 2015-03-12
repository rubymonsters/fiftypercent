namespace :blog do
  desc 'imports posts from a wordpress WXR File'

  task(import: :environment) do
    
    file_path = "#{Rails.root}/lib/assets/blog_import.xml"

    items = []

    File.open(file_path) do |f|
      doc   = Nokogiri::XML(f)
      items = doc.xpath("//channel//item")
    end

    articles = items.map do |item|
      a = Article.new
      a.title           = item.at_xpath('title').text
      a.pubDate         = item.at_xpath('pubDate').text
      a.dc_creator      = item.at_xpath('dc:creator').text
      a.content_encoded = item.at_xpath('content:encoded').text
      a.tags            = item.xpath('category').map{|node| node['nicename']}
      a.post_type       = item.at_xpath('wp:post_type').text
      a.wp_status       = item.at_xpath('wp:status').text
      a
    end

    articles.reject(&:unwanted?).each do |article|
      puts "+------------------------------------------+"
      puts article.title
      
      event = Event.new(
        title: article.title,
        created_at: article.created_at,
        body: article.content_encoded,
        tag_list: article.tags.join(', '),
        mod_state: 'ok'
      )
      event.save!(validate: false)
    end



    puts "all articles:      #{articles.length}"
    puts "unwanted articles:  #{articles.select(&:unwanted?).length}"


  end
end