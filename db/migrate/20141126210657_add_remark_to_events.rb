class AddRemarkToEvents < ActiveRecord::Migration
  def change
    add_column :events, :remark, :text
  end
end
