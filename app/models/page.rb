class Page < ActiveRecord::Base

  translates :title, :body, :fallbacks_for_empty_translations => true

  accepts_nested_attributes_for :translations

  scope :sidebar_snippets, -> { where( location: 'sidebar_snippet') }
  scope :menu_pages,       -> { where( location: 'menu') }


end
