class BlogPagesController < ApplicationController

  layout 'blog'

  def show
    @page = Page.where(slug: params[:slug]).first
  end
end