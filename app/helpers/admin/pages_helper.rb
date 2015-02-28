module Admin::PagesHelper
  def logo_for_page(page)
    icon_name = {
      blog_post: 'leaf',
      sidebar_snippet:   'align-justify',
      menu_page: 'file'
      }[page.page_type.to_sym]
    return "<span class=\"glyphicon glyphicon-#{icon_name}\" title=\"#{page.page_type}\"></span>".html_safe
  end
end