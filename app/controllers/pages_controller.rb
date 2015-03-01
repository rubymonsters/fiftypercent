class PagesController < ApplicationController
  def show
    @page = Page.menu_pages.where(slug: params[:slug]).first
  end
end