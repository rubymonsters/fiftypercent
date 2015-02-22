class Admin::PagesController < Admin::BaseController

  def new
    @page = Page.new
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


  private

  def build_empty_locales_for_form(object)
    %w(de en).each do |language|
      object.translations.build(locale: language) unless object.translated_locales.include?(language.to_sym)
    end
  end

  def page_params
    params.require(:page).permit(:slug,
                                 :location,
                                 :rank,
                                 translations_attributes: [:title, :body, :locale] )
  end
end
