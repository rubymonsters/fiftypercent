class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :title
      t.text :body
      t.string :public_contact
      t.string :internal_contact

      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
