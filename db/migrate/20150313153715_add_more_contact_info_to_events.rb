class AddMoreContactInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reporter_twitter, :string
    add_column :events, :reporter_email, :string
  end
end
