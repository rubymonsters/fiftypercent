class AddInternalInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :internal_user_info, :text
    add_column :events, :internal_admin_info, :text
  end
end
