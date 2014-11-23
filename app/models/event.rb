class Event < ActiveRecord::Base

  EDIT_TIME = 20 # minutes the event stays editable by the author

  validates :title, :date, :city, :country_code, :main_url, :total, :woman, :reporter, presence: true
  validates :total, :woman, numericality: true

  acts_as_taggable
  acts_as_taggable_on :topics

  scope :published,   -> { where('events.published_at IS NOT NULL') }
  scope :unpublished, -> { where('events.published_at IS NULL') }

  def self.search(q)
    Event.where('events.title ILIKE ? OR events.subtitle ILIKE ? OR events.description ILIKE ? OR events.reporter ILIKE ?',
                "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%")
  end

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

  def recently_created?
    remaining_edit_time > 0
  end

  def remaining_edit_time
    created_at - EDIT_TIME.minutes.ago
  end

  def frontend_editable?(reported_events_ids, current_user)
    current_user.present? || (reported_events_ids.to_a.include?(id) && recently_created?)
  end
end
