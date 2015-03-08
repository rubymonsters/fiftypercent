class Page < ActiveRecord::Base

  translates :title, :body, :fallbacks_for_empty_translations => true

  has_and_belongs_to_many :blog_categories

  accepts_nested_attributes_for :translations

  validates :slug, format: { with: /\A[a-z0-9_]+\z/, message: "only allows letters, numbers and underscore" }
  validates :slug, :page_type, presence: true
  validates :slug, uniqueness: true
  validates :rank, presence: true, if: Proc.new {|page| %w(sidebar_snippet menu_page blog_page blog_sidebar_snippet).include?(page.page_type)}
  validates :rank, uniqueness: {scope: 'page_type'}, allow_nil: true

  scope :blog_posts,            -> { where( page_type: 'blog_post') }
  scope :blog_pages,            -> { where( page_type: 'blog_page') }
  scope :blog_sidebar_snippets, -> { where( page_type: 'blog_sidebar_snippet') }
  scope :sidebar_snippets,      -> { where( page_type: 'sidebar_snippet') }
  scope :menu_pages,            -> { where( page_type: 'menu_page') }

  def abstract
    body_str   = translation_for(I18n.locale).body
    match_data = /\[\-\-\-\]/.match(body_str)
    match_data ? match_data.pre_match : nil
  end

  def main_body
    body_str   = translation_for(I18n.locale).body
    match_data = /\[\-\-\-\]/.match(body_str)
    match_data ? match_data.post_match : body_str
  end

  def full_body
    body_str   = translation_for(I18n.locale).body
    body_str.gsub(/\[\-\-\-\]/, "\n")
  end
end
