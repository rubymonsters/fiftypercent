class BlogCategory < ActiveRecord::Base
  
  translates :name, :fallbacks_for_empty_translations => true
  
  has_and_belongs_to_many :pages
  
  accepts_nested_attributes_for :translations
  
  validates :slug, format: { with: /\A[a-z0-9_]+\z/, message: "only allows letters, numbers and underscore" }
  validates :slug, :rank, presence: true
  validates :slug, :rank, uniqueness: true
  validates :rank, :numericality => { greater_than: 0}
end
