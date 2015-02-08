class Admin::CommentsController < Admin::BaseController

  before_action :set_comment, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def index
    @commentable = find_commentable
    if @commentable
      @comments = @commentable.comments.all.page(params[:page])
    else
      @comments    = Comment.includes(:commentable).order(created_at: :desc).page(params[:page]).per(40)
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