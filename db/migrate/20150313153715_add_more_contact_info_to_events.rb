class AddMoreContactInfoToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :reporter_twitter, :string
    add_column :events, :reporter_email, :string
  end
end
