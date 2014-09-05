class Event < ActiveRecord::Base
  validates :title, :date, :city, :country, :main_url, :total, :woman, :reporter, presence: true
  validates :total, :woman, numericality: true

  def male
    100 - (woman.to_f/total.to_f*100).to_i
  end

end
