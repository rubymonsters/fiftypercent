class CreateJoinTableBlogCategoryPage < ActiveRecord::Migration[4.2]
  def change
    create_join_table :blog_categories, :pages do |t|
      t.index [:blog_category_id, :page_id]
      t.index [:page_id, :blog_category_id]
    end
  end
end
