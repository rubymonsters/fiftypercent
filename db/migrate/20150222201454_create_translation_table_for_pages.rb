class CreateTranslationTableForPages < ActiveRecord::Migration
  def up
    Page.create_translation_table! :title => :string, :body => :text
  end
  def down
    Page.drop_translation_table!
  end
end
