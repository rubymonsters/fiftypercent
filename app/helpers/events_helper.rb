module EventsHelper
  include ActsAsTaggableOn::TagsHelper

  def is_single_view
    action_name == 'show'
  end

  def linked_contact_info(contact_info)

    case contact_info
    when /^@/
      link_to(contact_info, "https://twitter.com/#{contact_info.gsub(/@/,'')}")
    when /^http/
      link_to('<span class="glyphicon glyphicon-share"></span> Link'.html_safe, contact_info)
    when /.+@.+/
      contact_info.sub(/@/, '(-ät-)')
    else
      contact_info
    end

  end

  def classname_for_event_title(event)
    event.percent_female >= 50 ? "more-female" : "more-male"
  end

end

