class CreateImages < ActiveRecord::Migration[4.2]
  def change
    create_table :images do |t|
      t.string :name
      t.text :description
      t.string :file

      t.timestamps null: false
    end
  end
end
