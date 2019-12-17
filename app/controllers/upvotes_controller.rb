class UpvotesController < ApplicationController
  def create
    Upvote.create(idea_id: params[:idea_id], user: current_user)
    @idea = Idea.find(params[:idea_id])
    respond_to do |format|
      format.html { redirect_to idea_path(@idea) }
      format.js
    end
  end
end
