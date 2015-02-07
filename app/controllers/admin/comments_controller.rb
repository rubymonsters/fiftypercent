class Admin::CommentsController < Admin::BaseController

  before_action :set_comment, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  def index
    @comments = Comment.all
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

end
