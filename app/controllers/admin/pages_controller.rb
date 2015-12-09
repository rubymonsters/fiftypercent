class Admin::PagesController < Admin::BaseController

  def index
    case params[:page_type]
    when 'blog_post'
      @pages = Page.blog_posts
    when 'blog_page'
      @pages = Page.blog_pages
    when 'blog_sidebar_snippet'
      @pages = Page.blog_sidebar_snippets
    when 'sidebar_snippet'
      @pages = Page.sidebar_snippets
    when 'menu_page'
      @pages = Page.menu_pages
    else
      @pages = Page.all
    end

    @pages = @pages.includes(:translations).order(rank: :asc, created_at: :desc)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    if params[:page_type] == 'blog_post'
      @page.page_type   = 'blog_post'
      @is_new_blog_post = true
    end
    build_empty_locales_for_form(@page)
  end

  def create
    @page = Page.new(page_params)
    if  @page.save
      redirect_to admin_pages_path, notice: 'Text was successfully created.'
    else
      flash[:error] = 'The text could not be saved.'
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
    build_empty_locales_for_form(@page)
  end

  def update
    @page = Page.find(params[:id])
    if  @page.update_attributes(page_params)
      redirect_to admin_page_path(@page), notice: 'Text was successfully updated.'
    else
      flash[:error] = 'The text could not be saved.'
      build_empty_locales_for_form(@page)
      render :edit
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path, notice: "Page deleted"
  end


  private

  def build_empty_locales_for_form(object)
    %w(de en).each do |language|
      unless object.translated_locales.include?(language.to_sym)
        object.translations.build(locale: language.to_sym)
      end
    end
  end

  def page_params
    params.require(:page).permit(:slug,
                                 :page_type,
                                 :rank,
                                 :public,
                                 { blog_category_ids: [] },
                                 {translations_attributes: [:id, :title, :body, :locale]}
                                 )
  end
end
