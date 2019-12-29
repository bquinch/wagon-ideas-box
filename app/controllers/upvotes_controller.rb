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


# def create
#   @upvote = Upvote.new()
#   @upvote.user = current_user
#   @upvote.idea = Idea.find(params[:idea_id])
#   @idea = Idea.find(params[:idea_id])
#   if @upvote.save
#     respond_to do |format|
#       format.html { redirect_back fallback_location: root_path, notice: "Added to upvotes" }
#       format.js { flash[:notice] = "Upvoted" }
#       #
#     end
#   else
#     respond_to do |format|
#       format.html { render 'ideas/show' }
#       format.js
#     end
#   end
# end

# end
