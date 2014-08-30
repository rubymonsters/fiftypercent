class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :subtitle
      t.datetime :date
      t.string :city
      t.string :country
      t.text :description
      t.string :main_url
      t.string :contact_url
      t.string :speaker_list_url
      t.integer :woman
      t.integer :total
      t.string :category
      t.string :reporter
      t.string :reporter_url

      t.timestamps
    end
  end
end
