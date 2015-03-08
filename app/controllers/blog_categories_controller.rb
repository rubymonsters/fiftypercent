class BlogCategoriesController < ApplicationController
  def show
    @blog_category = BlogCategory.where(slug: params[:slug]).first
    @posts = @blog_category.pages.where(page_type: 'blog_post').order('created_at DESC').all
    render 'blog_posts/index'
  end
end