class Event < ActiveRecord::Base
  validates :title, :date, :city, :country_code, :main_url, :total, :woman, :reporter, presence: true
  validates :total, :woman, numericality: true

  acts_as_taggable
  acts_as_taggable_on :topics

  def male
    100 - (woman.to_f/total.to_f*100).to_i
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
