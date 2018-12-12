class BlogCategoriesController < ApplicationController

  layout 'blog'

  def show
    @blog_category = BlogCategory.where(slug: params[:slug]).first
    if @blog_category
		@posts = @blog_category.pages.where(page_type: 'blog_post').order('created_at DESC').all
	end
    render 'blog_posts/index'
  end
end