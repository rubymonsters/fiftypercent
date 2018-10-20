class AddMoreContactInfoForEventOrganizerToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :contact_twitter, :string
    add_column :events, :contact_email, :string
  end
end
