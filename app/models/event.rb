class Event < ActiveRecord::Base
  validates :title, :date, :city, :country_code, :main_url, :total, :woman, :reporter, presence: true
  validates :total, :woman, numericality: true

  acts_as_taggable
  acts_as_taggable_on :topics

  scope :published,   -> { where('events.published_at IS NOT NULL') }
  scope :unpublished, -> { where('events.published_at IS NULL') }

  def male
    100 - (woman.to_f/total.to_f*100).to_i
  end

  def country_name
    country = ISO3166::Country[country_code]
    if country
      country.translations[I18n.locale.to_s] || country.name
    else
      ''
    end
  end

  def published?
    published_at.present?
  end

  def self.search(q)
    Event.where('events.title ILIKE ? OR events.subtitle ILIKE ? OR events.description ILIKE ? OR events.reporter ILIKE ?',
                "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%")
  end
end
