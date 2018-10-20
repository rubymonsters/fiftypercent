class AddTextOrganizersToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column    :events, :organizers,  :text
    change_column :events, :contact_url, :text
  end
end
