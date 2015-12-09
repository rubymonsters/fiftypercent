class AddPublicAttributeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :public, :boolean, default: false
  end
end
