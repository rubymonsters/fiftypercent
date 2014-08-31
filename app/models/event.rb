class Event < ActiveRecord::Base

  def male
    100 - (woman.to_f/total.to_f*100).to_i
  end

end
