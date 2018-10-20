class AddModStateToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :mod_state, :string
  end
end
