class UpvotesController < ApplicationController
  def create
    Upvote.create(idea_id: params[:idea_id], user: current_user)
    redirect_to ideas_path
  end
end
