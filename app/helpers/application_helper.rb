module ApplicationHelper

  def bootstrap_class_for(flash_type)
    { success: "alert-success",
      error:   "alert-danger",
      alert:   "alert-warning",
      notice:  "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, class: "alert #{bootstrap_class_for(msg_type.to_sym)} fade in") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat raw(message)
      end)
    end
    nil
  end

  def layout_needs_sidebar?
    params[:controller] == 'events' and %w(index show).include?(params[:action])
  end

  def language_switcher
    target_url = request.original_url
    if request.fullpath == '/'
      target_url += "#{I18n.locale.to_s}/"
    end
    links = [:de, :en].map do |lang|
      if lang == I18n.locale
        link_to(lang.to_s.upcase, target_url, class: 'active')
      else
        link_to(lang.to_s.upcase, target_url.sub(/\/(de|en)\//,"/#{lang.to_s}/"))
      end
    end
    links.join('|')
  end

  def markdown(text, options={})
    render_options = {
      safe_links_only: true,
      no_images:       true,
      hard_wrap:       true
    }.merge(options)

    extensions = {
      autolink:           true,
      # superscript:        true,
      # disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(render_options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
