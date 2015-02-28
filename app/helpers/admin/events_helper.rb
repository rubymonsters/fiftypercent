module Admin::EventsHelper
  def events_description
    str = "showing #{params[:mod_state] || 'all'} events"
    if params[:q].present?
      str += " &mdash; search-string: <i>#{params[:q]}</i>"
    end
    str.html_safe
  end

  def event_mod_state_title(event)
    icon = case event.mod_state
    when 'ok'     then 'thumbs-up'
    when 'hidden' then 'thumbs-down'
    else 'question-sign'
    end
    "<span class=\"glyphicon glyphicon-#{icon}\"></span>&nbsp; mod.-state: <strong>#{event.mod_state}</strong>".html_safe
  end
end
