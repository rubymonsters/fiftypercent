module Admin::CommentsHelper
  def comments_description
    str = "showing #{params[:mod_state] || 'all'} comments"
    if params[:q].present?
      str += " &mdash; search-string: <i>#{params[:q]}</i>"
    end
    str.html_safe
  end
end
