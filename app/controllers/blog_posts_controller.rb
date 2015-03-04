class BlogPostsController < ApplicationController
  def index
    @posts = Page.blog_posts.all
  end

  def show
    @post = Page.find(params[:id])
  end
end
