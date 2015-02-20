class Admin::CommentsController < Admin::BaseController

  before_action :set_comment, only: [:show, :edit, :update, :destroy, :publish, :hide, :uncheck]

  def index
    @commentable = find_commentable

    if @commentable
      @comments = @commentable.comments.all.page(params[:page])
    else

      if params[:q].present?
        @comments = Comment.search(params[:q])
      else
        @comments = Comment.all
      end

      case params[:mod_state]
      when 'unchecked'
        @comments = @comments.unchecked
      when 'published'
        @comments = @comments.published
      when 'hidden'
        @comments = @comments.hidden
      end
      @comments = @comments.includes(:commentable).order(created_at: :desc).page(params[:page]).per(40)

    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to admin_comment_path(@comment), flash: {success: "Successfully updated comment: <strong>\"#{@comment.title}\"</strong>"}
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_comments_path, flash: {success: "Successfully deleted event: <strong>\"#{@comment.title}\" by #{@comment.author}</strong>"}
  end

  def publish
    @comment.update_attributes(mod_state: 'ok')
    respond_to do |format|
      format.html {redirect_to admin_event_path(@comment), flash: {success: "Successfully <strong>published</strong> event: <strong>\"#{@comment.title}\"</strong>"}}
      format.js {}
    end
  end

  def hide
    @comment.update_attributes(mod_state: 'hidden')
    respond_to do |format|
      format.html {redirect_to admin_event_path(@comment), flash: {success: "Successfully <strong>hid</strong> event: <strong>\"#{@comment.title}\"</strong>"}}
      format.js {}
    end
  end

  def uncheck
    @comment.update_attributes(mod_state: nil)
    respond_to do |format|
      format.html {redirect_to admin_event_path(@comment), flash: {success: "Successfully <strong>un-published</strong> event: <strong>\"#{@comment.title}\"</strong>"}}
      format.js {}
    end
  end


  private

    def comment_params
      params.require(:comment).permit!
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def find_commentable
      if params[:commentable_type] && params[:commentable_id]
        params[:commentable_type].constantize.find(params[:commentable_id].to_i)
      end
    end

end