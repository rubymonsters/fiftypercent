class Event < ActiveRecord::Base

  has_many :comments, as: :commentable, dependent: :destroy

  EDIT_TIME = 20 # minutes the event stays editable by the author

  validates :title, :date, :city, :country_code, :main_url, :total, :woman, presence: true
  validates :total, :woman, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  acts_as_taggable
  acts_as_taggable_on :topics

  scope :unchecked, -> { where('events.mod_state IS NULL') }
  scope :published, -> { where( mod_state: 'ok') }
  scope :hidden,    -> { where( mod_state: 'hidden') }

  def self.search(q)
    q.strip!
    Event.where('events.title ILIKE ? OR events.subtitle ILIKE ? OR events.description ILIKE ? OR events.reporter ILIKE ? OR events.city ILIKE ?',
                "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%", "%#{q}%")
  end

  def percent_male
    100 - (woman.to_f/total.to_f*100).to_i
  end

  def percent_female
    (woman.to_f/total.to_f*100).to_i
  end

  def country_name
    country = ISO3166::Country[country_code]
    if country
      country.translations[I18n.locale.to_s] || country.name
    else
      ''
    end
  end

  def unchecked?
    mod_state == nil
  end

  def published?
    mod_state == 'ok'
  end

  def hidden?
    mod_state == 'hidden'
  end

  def recently_created?
    remaining_edit_time > 0
  end

  def remaining_edit_time
    created_at - EDIT_TIME.minutes.ago
  end

  def frontend_editable?(reported_events_ids)
    reported_events_ids.to_a.include?(id) && recently_created?
  end
end
