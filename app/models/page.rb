class Page < ActiveRecord::Base

  translates :title, :body, :fallbacks_for_empty_translations => true

  accepts_nested_attributes_for :translations

  validates :slug, format: { with: /\A[a-z0-9_]+\z/, message: "only allows letters, numbers and underscore" }
  validates :slug, :page_type, presence: true
  validates :slug, uniqueness: true
  validates :rank, presence: true, if: Proc.new {|page| %w(sidebar_snippet menu_page).include?(page.page_type)}
  validates :rank, uniqueness: {scope: 'page_type'}, allow_nil: true

  scope :blog_posts,       -> { where( page_type: 'blog_post') }
  scope :sidebar_snippets, -> { where( page_type: 'sidebar_snippet') }
  scope :menu_pages,       -> { where( page_type: 'menu_page') }

end
