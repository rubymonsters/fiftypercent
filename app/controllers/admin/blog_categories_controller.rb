class Admin::BlogCategoriesController < Admin::BaseController
  before_action :set_blog_category, only: [:show, :edit, :update, :destroy]


  def index
    @blog_categories = BlogCategory.order('rank ASC').all
  end


  def show
  end


  def new
    @blog_category = BlogCategory.new
    build_empty_locales_for_form(@blog_category)
  end

  def edit
    build_empty_locales_for_form(@blog_category)
  end

  def create
    @blog_category = BlogCategory.new(blog_category_params)

    if @blog_category.save
      redirect_to admin_blog_categories_path, notice: 'Blog category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog_category.update(blog_category_params)
      redirect_to admin_blog_categories_path, notice: 'Blog category was successfully updated.'
    else
      build_empty_locales_for_form(@blog_category)
      render :edit
    end
  end

  def destroy
    @blog_category.destroy
    redirect_to admin_blog_categories_path, notice: 'Blog category was successfully destroyed.'
  end

  private

    def build_empty_locales_for_form(object)
      %w(de en).each do |language|
        unless object.translated_locales.include?(language.to_sym)
          object.translations.build(locale: language.to_sym)
        end
      end
    end

    def set_blog_category
      @blog_category = BlogCategory.find(params[:id])
    end

    def blog_category_params
      params.require(:blog_category).permit(:slug,
                                            :rank,
                                            translations_attributes: [:id, :name, :locale])
    end
end
