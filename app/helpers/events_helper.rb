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
      link_to(contact_info, contact_info)
    else
      contact_info
    end

  end

end

