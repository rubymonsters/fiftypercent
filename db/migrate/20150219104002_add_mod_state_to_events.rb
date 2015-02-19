class AddModStateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :mod_state, :string
  end
end
