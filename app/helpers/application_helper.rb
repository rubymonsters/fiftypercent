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
end
