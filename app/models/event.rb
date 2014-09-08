class Event < ActiveRecord::Base
  validates :title, :date, :city, :country, :main_url, :total, :woman, :reporter, presence: true
  validates :total, :woman, numericality: true

  acts_as_taggable
  acts_as_taggable_on :topics

  def male
    100 - (woman.to_f/total.to_f*100).to_i
  end

end
