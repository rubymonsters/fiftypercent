class CreateBlogCategories < ActiveRecord::Migration[4.2]
  
  def up
    create_table :blog_categories do |t|
      t.string :slug
      t.string :name
      t.integer :rank

      t.timestamps null: false
    end
    
    BlogCategory.create_translation_table! :name => :string
  end

  def down
    drop_table :blog_categories
    
    BlogCategory.drop_translation_table!
  end
end
