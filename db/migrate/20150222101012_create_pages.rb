class CreatePages < ActiveRecord::Migration[4.2]
  def change
    create_table :pages do |t|
      t.string :slug
      t.string :title
      t.text :body
      t.string :location
      t.integer :rank

      t.timestamps null: false
    end
  end
end
