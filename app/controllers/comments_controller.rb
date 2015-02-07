class CommentsController < ApplicationController

  def create
    @event   = Event.find params[:event_id]
    if !@event.published?
      redirect_to events_path, notice: 'This event cannot be commented.'
    end
    @comment = @event.comments.new(comment_params)
    
    if @comment.save
      flash[:success] = 'Ergänung erfolgreich gespeichert.'
      redirect_to event_path(@event)
    else
      flash[:error]   = 'Ihre Ergänzung konnnte nicht gespeichert werden.'
      render 'events/show'
    end
  end

 private
    def comment_params
      params.require(:comment).permit(:title, 
                                      :author,
                                      :body,
                                      :public_contact,
                                      :internal_contact)
    end

end