class RenamePageLocationToPageType < ActiveRecord::Migration[4.2]
  def change
    change_table :pages do |t|
      t.rename :location, :page_type
    end
  end
end
