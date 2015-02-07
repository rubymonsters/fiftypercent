class RemovePublishedAtFromComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :published_at
      t.string :mod_state
    end    
  end
end
