class CreateComments < ActiveRecord::Migration[4.2]
  def change
    create_table :comments do |t|
      t.text :title
      t.text :body
      t.string :author
      t.string :public_contact
      t.string :internal_contact
      t.datetime :published_at

      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
