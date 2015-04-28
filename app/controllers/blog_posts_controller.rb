class BlogPostsController < ApplicationController

  layout 'blog'

  def index
    @posts = Page.blog_posts.order('created_at DESC').all
  end

  def show
    @post = Page.find(params[:id])
  end
end
