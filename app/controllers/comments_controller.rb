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
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @idea = @comment.idea
    @comment.destroy
    redirect_to idea_path(@idea), notice: 'comment deleted'
  end

  private

  def comment_params
    params.require('comment').permit(:message, :upvote)
  end
end
