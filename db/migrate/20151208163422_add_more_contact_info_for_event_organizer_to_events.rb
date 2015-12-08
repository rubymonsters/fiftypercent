class AddMoreContactInfoForEventOrganizerToEvents < ActiveRecord::Migration
  def change
    add_column :events, :contact_twitter, :string
    add_column :events, :contact_email, :string
  end
end
