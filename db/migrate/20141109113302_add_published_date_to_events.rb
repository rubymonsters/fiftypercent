class AddPublishedDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :published_at, :datetime
  end
end
