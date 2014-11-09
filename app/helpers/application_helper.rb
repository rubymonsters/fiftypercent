module ApplicationHelper
  def layout_needs_sidebar?
    params[:controller] == 'events' and %w(index show).include?(params[:action])
  end
end
