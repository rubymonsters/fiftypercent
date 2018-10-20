class AddPublicAttributeToPages < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :public, :boolean, default: false
  end
end
