class RemovePublishedAtFromComments < ActiveRecord::Migration[4.2]
  def change
    change_table :comments do |t|
      t.remove :published_at
      t.string :mod_state
    end    
  end
end
