class AddPublishedDateToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :published_at, :datetime
  end
end
