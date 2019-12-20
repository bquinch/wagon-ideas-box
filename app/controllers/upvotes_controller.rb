class UpvotesController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    return if @idea.user == current_user

    Upvote.create(idea_id: params[:idea_id], user: current_user)
    respond_to do |format|
      format.html { redirect_to idea_path(@idea) }
      format.js
    end
  end
end
