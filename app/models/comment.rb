class Comment < ActiveRecord::Base

   belongs_to :commentable, polymorphic: true
   validates :title, :author, :body, presence: true

   scope :unchecked, -> { where('comments.mod_state IS NULL') }
   scope :published, -> { where( mod_state: 'ok') }
   scope :hidden,    -> { where( mod_state: 'hidden') }

   def self.search(q)
     q.strip!
     Comment.where('comments.title ILIKE ? OR comments.body ILIKE ? OR comments.author ILIKE ?',
                 "%#{q}%", "%#{q}%", "%#{q}%")
   end


   def unchecked?
     mod_state == nil
   end

   def published?
     mod_state == 'ok'
   end

   def hidden?
     mod_state == 'hidden'
   end

end
