class AddRemarkToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :remark, :text
  end
end
