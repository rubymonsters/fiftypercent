class Comment < ActiveRecord::Base
  
   belongs_to :commentable, polymorphic: true

   validates :title, :author, :body, presence: true
end
