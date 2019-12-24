class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new()
    @favorite.user = current_user
    @favorite.idea = Idea.find(params[:idea_id])
    @idea = Idea.find(params[:idea_id])
    if @favorite.save
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: "Added to favorites" }
        format.js { flash[:notice] = "Added to favorites" }
        #
      end
    else
      respond_to do |format|
        format.html { render 'ideas/show' }
        format.js
      end
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @idea = @favorite.idea
    if @favorite.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: "Removed from favorites" }
        format.js { flash[:notice] = "Removed from favorites" }
      end
    else
      respond_to do |format|
        format.html { render 'ideas/show' }
        format.js
      end
    end
  end
end
