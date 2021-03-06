class CommentsController < ApplicationController
  def new
    @idea = Idea.find(params[:idea_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @comment.user = @user
    @idea = Idea.find(params[:idea_id])
    @comment.idea = @idea
    if @comment.save
      respond_to do |format|
        format.html { redirect_to idea_path(@idea) }
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @idea = @comment.idea
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to idea_path(@idea), notice: 'comment deleted' }
        format.js
      end
    else
      render "ideas/#{idea.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
