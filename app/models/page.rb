class Page < ActiveRecord::Base

  translates :title, :body, :fallbacks_for_empty_translations => true

  accepts_nested_attributes_for :translations

  validates :rank, uniqueness: {scope: 'page_type'}

  scope :blog_posts,       -> { where( page_type: 'blog_post') }
  scope :sidebar_snippets, -> { where( page_type: 'sidebar_snippet') }
  scope :menu_pages,       -> { where( page_type: 'menu') }

end
