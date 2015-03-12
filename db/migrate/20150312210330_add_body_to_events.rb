class AddBodyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :body, :text
  end
end
