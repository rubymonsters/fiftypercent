class AddBodyToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :body, :text
  end
end
