class RenamePageLocationToPageType < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.rename :location, :page_type
    end
  end
end
