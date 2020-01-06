class UpvotesController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    return if @idea.user == current_user

    @upvote = Upvote.new
    @upvote.user = current_user
    @upvote.idea = Idea.find(params[:idea_id])
    if @upvote.save
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: "You voted for this idea" }
        format.js { flash[:notice] = "You voted for this idea" }
      end
    else
      respond_to do |format|
        format.html { render 'ideas/show' }
        format.js
      end
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @idea = @upvote.idea
    if @upvote.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: "Removed vote" }
        format.js { flash[:notice] = "Removed vote" }
      end
    else
      respond_to do |format|
        format.html { render 'ideas/show' }
        format.js
      end
    end
  end
end
