class BlogPagesController < ApplicationController
  def show
    @page = Page.where(slug: params[:slug]).first
  end
end