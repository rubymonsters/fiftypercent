class Page < ActiveRecord::Base

  scope :snippets, -> { where( location: 'snippet') }
  scope :menu_pages,    ->  { where( location: 'menu') }

end
