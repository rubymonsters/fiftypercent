class BlogPostsController < ApplicationController

  layout 'blog'

  def index
    @posts = Page.blog_posts.order('created_at DESC').limit(12).all
  end

  def show
    @post = Page.find(params[:id])
  end

  def export
    respond_to do |format|
      @posts = Page.blog_posts.order('created_at DESC').limit(12).all
      @posts_to_export = @posts.map{|post| {title: post.title,
                                             body: post.body,
                                              url: blog_post_url(post),
                                       created_at: post.created_at
                                            }}
      format.json { render json: @posts_to_export }
    end
  end

end
